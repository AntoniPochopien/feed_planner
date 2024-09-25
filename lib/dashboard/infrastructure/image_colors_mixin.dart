import 'dart:typed_data';
import 'dart:ui';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

mixin class ImageColorsMixin {
  Future<Set<Color>> getColors(XFile file) async {
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
}
