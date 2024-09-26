import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:feed_planner/dashboard/domain/image_with_dominating_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'images_state.dart';
part 'images_cubit.freezed.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final IImagesRepository imagesRepository;
  ImagesCubit({
    required this.imagesRepository,
  }) : super(const ImagesState());

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final images =
          List<ImageWithDominatingColor>.from(state.imagesWithDominatingColor);
      images.add(ImageWithDominatingColor(xfile: image));
      emit(state.copyWith(imagesWithDominatingColor: images));
      _computeAndUpdateMissingColors();
    }
  }

  void updateOrder(int oldIndex, int newIndex) {
    final images =
        List<ImageWithDominatingColor>.from(state.imagesWithDominatingColor);
    final item = images[oldIndex];
    images.removeAt(oldIndex);
    images.insert(newIndex, item);
    emit(state.copyWith(imagesWithDominatingColor: images));
  }

  void _computeAndUpdateMissingColors() async {
    emit(state.copyWith(dragEnabled: false));
    final images =
        List<ImageWithDominatingColor>.from(state.imagesWithDominatingColor);
    final index = images.indexWhere((element) => element.color == null);
    if (index != -1) {
      final result = await imagesRepository
          .getDominantColorFromXFiles([images[index].xfile]);
      final entry = result.entries.first;
      final newImage =
          ImageWithDominatingColor(xfile: entry.key, color: entry.value);
      images.removeAt(index);
      images.insert(index, newImage);
      emit(state.copyWith(imagesWithDominatingColor: images));
    }
    emit(state.copyWith(dragEnabled: true));
  }
}
