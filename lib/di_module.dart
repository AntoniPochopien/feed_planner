import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:feed_planner/dashboard/infrastructure/images_repository.dart';
import 'package:feed_planner/navigation/app_router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diInit(){
  getIt.registerLazySingleton(() => AppRouter());
  getIt.registerLazySingleton<IImagesRepository>(() => ImagesRepository());
}