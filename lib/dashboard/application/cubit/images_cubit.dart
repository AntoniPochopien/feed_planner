import 'dart:developer';

import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
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
      final images = List<XFile>.from(state.images);
      emit(state.copyWith(images: images..add(image)));
    }
  }

  void computeColors() async {
    final imagesWithDominatingColors =
        await imagesRepository.getDominantColorFromXFiles(state.images);
    log(imagesWithDominatingColors.toString());
  }
}
