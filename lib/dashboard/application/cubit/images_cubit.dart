import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:flutter/material.dart';
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
    emit(state.copyWith(isLoading: true));
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final images = List<XFile>.from(state.imageWithDominatingColor.keys);
      images.add(image);
      final result = await _computeColors(images);
      emit(state.copyWith(imageWithDominatingColor: result, isLoading: false));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<Map<XFile, Color>> _computeColors(List<XFile> files) async =>
      await imagesRepository.getDominantColorFromXFiles(files);
}
