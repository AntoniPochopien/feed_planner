part of 'images_cubit.dart';

@freezed
class ImagesState with _$ImagesState {
  const factory ImagesState({
    @Default([]) List<ImageWithDominatingColor> imagesWithDominatingColor,
  }) = _ImagesState;
}
