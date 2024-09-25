import 'dart:ui';

mixin class DominantColorMixin {
  Color findDominantColor(Set<Color> colors) {
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
