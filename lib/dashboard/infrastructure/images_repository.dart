import 'dart:ui';

import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:feed_planner/dashboard/infrastructure/dominant_color_mixin.dart';
import 'package:feed_planner/dashboard/infrastructure/image_colors_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagesRepository
    with ImageColorsMixin, DominantColorMixin
    implements IImagesRepository {
  @override
  Future<Map<XFile, Color>> getDominantColorFromXFiles(
      List<XFile> files) async {
    return await compute(_getDominantColorFromXFiles, files);
    // return await _getDominantColorFromXFiles(files);
  }

  Future<Map<XFile, Color>> _getDominantColorFromXFiles(
      List<XFile> files) async {
    final imagesWithDominatingColors = <XFile, Color>{};
    for (final i in files) {
      final colors = await getColors(i);
      final dominantColor = findDominantColor(colors);
      imagesWithDominatingColors.addAll({i: dominantColor});
    }
    return imagesWithDominatingColors;
  }
}
