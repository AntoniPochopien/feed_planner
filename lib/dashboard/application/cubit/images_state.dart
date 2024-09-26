part of 'images_cubit.dart';

@freezed
class ImagesState with _$ImagesState {
  const factory ImagesState({
    @Default(false) bool dragEnabled,
    @Default([]) List<ImageWithDominatingColor> imagesWithDominatingColor,
  }) = _ImagesState;
}
