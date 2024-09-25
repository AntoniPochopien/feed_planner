part of 'images_cubit.dart';

@freezed
class ImagesState with _$ImagesState {
  const factory ImagesState({
    @Default(false) bool isLoading,
    @Default({}) Map<XFile, Color> imageWithDominatingColor,
  }) = _ImagesState;
}
