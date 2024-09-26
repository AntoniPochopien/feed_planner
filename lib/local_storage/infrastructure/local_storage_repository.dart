import 'dart:io';

import 'package:feed_planner/dashboard/domain/image_with_dominating_color.dart';
import 'package:feed_planner/dashboard/domain/image_with_dominating_color_db.dart';
import 'package:feed_planner/local_storage/domain/i_local_storage_repository.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  late final Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ImageWithDominatingColorDbAdapter());
    box = await Hive.openBox('FeedPlanner');
  }

  @override
  List<ImageWithDominatingColor>? readImages() {
    final images = box.get('images');
    if (images == null) {
      return [];
    }
    images as List;
    return images
        .map((e) => (e as ImageWithDominatingColorDb).toDomain())
        .toList();
  }

  @override
  Future<void> saveImages(List<ImageWithDominatingColor> images) async {
    final dbImages = await Future.wait(images.map((e) async {
      final filepath = await _saveImageToFile(e.xfile);
      return ImageWithDominatingColorDb(
          filePath: filepath, color: e.color?.value);
    }));
    box.put('images', dbImages);
  }

  Future<String> _saveImageToFile(XFile xfile) async {
    final imageData = await xfile.readAsBytes();
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${xfile.name}.png';
    final file = File(filePath);
    await file.writeAsBytes(imageData);
    return filePath;
  }
}
