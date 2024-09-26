import 'package:feed_planner/dashboard/domain/image_with_dominating_color.dart';

abstract class ILocalStorageRepository {
  Future<void> init();

  Future<void> saveImages(List<ImageWithDominatingColor> images);

  List<ImageWithDominatingColor>? readImages();
}
