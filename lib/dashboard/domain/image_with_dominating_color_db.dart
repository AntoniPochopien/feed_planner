import 'dart:ui';
import 'package:feed_planner/dashboard/domain/image_with_dominating_color.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

part 'image_with_dominating_color_db.g.dart';

@HiveType(typeId: 0)
class ImageWithDominatingColorDb {
  @HiveField(0)
  final String filePath;
  @HiveField(1)
  final int? color;
  const ImageWithDominatingColorDb({required this.filePath, this.color});

  ImageWithDominatingColor toDomain() {
    final file = XFile(filePath);
    final colorObject = color != null ? Color(color!) : null;
    return ImageWithDominatingColor(xfile: file, color: colorObject);
  }
}
