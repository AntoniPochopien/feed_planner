import 'dart:typed_data';
import 'dart:ui';

import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImagesRepository implements IImagesRepository {
  
  @override
  Future<Map<XFile, Color>> getDominantColorFromXFile(List<XFile> files) async {
    final imagesWithDominatingColors = <XFile, Color>{};
    for (final i in files) {
      final colors = await _getColors(i);
      final dominantColor = _findDominantColor(colors);
      imagesWithDominatingColors.addAll({i: dominantColor});
    }
    return imagesWithDominatingColors;
  }

  Future<Set<Color>> _getColors(XFile file) async {
    final data = await file.readAsBytes();
    final image = _setImageFromBytes(data);
    final colors = <Color>{};
    if (image != null) {
      final resizedImage = img.copyResize(image, width: 100, height: 100);
      final quantizedImage = img.quantize(resizedImage, numberOfColors: 64);

      for (final pixel in quantizedImage) {
        final alpha = pixel.a.toInt();
        final red = pixel.r.toInt();
        final green = pixel.g.toInt();
        final blue = pixel.b.toInt();
        final color = Color.fromARGB(alpha, red, green, blue);
        colors.add(color);
      }
    }
    return colors;
  }

  img.Image? _setImageFromBytes(Uint8List imageBytes) =>
      img.decodeImage(imageBytes);

  Color _findDominantColor(Set<Color> colors) {
    Color averageColor = _findAverageColor(colors);

    Color closestColor = colors.first;
    double minDistance = double.infinity;

    for (Color color in colors) {
      double distance = _colorDistance(color, averageColor);
      if (distance < minDistance) {
        minDistance = distance;
        closestColor = color;
      }
    }

    return closestColor;
  }

  double _colorDistance(Color c1, Color c2) {
    int r1 = c1.red, g1 = c1.green, b1 = c1.blue;
    int r2 = c2.red, g2 = c2.green, b2 = c2.blue;

    return ((r1 - r2) * (r1 - r2) +
            (g1 - g2) * (g1 - g2) +
            (b1 - b2) * (b1 - b2))
        .toDouble();
  }

  Color _findAverageColor(Set<Color> colors) {
    int totalRed = 0, totalGreen = 0, totalBlue = 0;

    for (Color color in colors) {
      totalRed += color.red;
      totalGreen += color.green;
      totalBlue += color.blue;
    }

    int avgRed = (totalRed / colors.length).round();
    int avgGreen = (totalGreen / colors.length).round();
    int avgBlue = (totalBlue / colors.length).round();

    return Color.fromARGB(255, avgRed, avgGreen, avgBlue);
  }
}
