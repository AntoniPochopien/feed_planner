// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'images_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImagesState {
  List<ImageWithDominatingColor> get imagesWithDominatingColor =>
      throw _privateConstructorUsedError;

  /// Create a copy of ImagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImagesStateCopyWith<ImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesStateCopyWith<$Res> {
  factory $ImagesStateCopyWith(
          ImagesState value, $Res Function(ImagesState) then) =
      _$ImagesStateCopyWithImpl<$Res, ImagesState>;
  @useResult
  $Res call({List<ImageWithDominatingColor> imagesWithDominatingColor});
}

/// @nodoc
class _$ImagesStateCopyWithImpl<$Res, $Val extends ImagesState>
    implements $ImagesStateCopyWith<$Res> {
  _$ImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesWithDominatingColor = null,
  }) {
    return _then(_value.copyWith(
      imagesWithDominatingColor: null == imagesWithDominatingColor
          ? _value.imagesWithDominatingColor
          : imagesWithDominatingColor // ignore: cast_nullable_to_non_nullable
              as List<ImageWithDominatingColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesStateImplCopyWith<$Res>
    implements $ImagesStateCopyWith<$Res> {
  factory _$$ImagesStateImplCopyWith(
          _$ImagesStateImpl value, $Res Function(_$ImagesStateImpl) then) =
      __$$ImagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ImageWithDominatingColor> imagesWithDominatingColor});
}

/// @nodoc
class __$$ImagesStateImplCopyWithImpl<$Res>
    extends _$ImagesStateCopyWithImpl<$Res, _$ImagesStateImpl>
    implements _$$ImagesStateImplCopyWith<$Res> {
  __$$ImagesStateImplCopyWithImpl(
      _$ImagesStateImpl _value, $Res Function(_$ImagesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesWithDominatingColor = null,
  }) {
    return _then(_$ImagesStateImpl(
      imagesWithDominatingColor: null == imagesWithDominatingColor
          ? _value._imagesWithDominatingColor
          : imagesWithDominatingColor // ignore: cast_nullable_to_non_nullable
              as List<ImageWithDominatingColor>,
    ));
  }
}

/// @nodoc

class _$ImagesStateImpl implements _ImagesState {
  const _$ImagesStateImpl(
      {final List<ImageWithDominatingColor> imagesWithDominatingColor =
          const []})
      : _imagesWithDominatingColor = imagesWithDominatingColor;

  final List<ImageWithDominatingColor> _imagesWithDominatingColor;
  @override
  @JsonKey()
  List<ImageWithDominatingColor> get imagesWithDominatingColor {
    if (_imagesWithDominatingColor is EqualUnmodifiableListView)
      return _imagesWithDominatingColor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesWithDominatingColor);
  }

  @override
  String toString() {
    return 'ImagesState(imagesWithDominatingColor: $imagesWithDominatingColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesStateImpl &&
            const DeepCollectionEquality().equals(
                other._imagesWithDominatingColor, _imagesWithDominatingColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_imagesWithDominatingColor));

  /// Create a copy of ImagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesStateImplCopyWith<_$ImagesStateImpl> get copyWith =>
      __$$ImagesStateImplCopyWithImpl<_$ImagesStateImpl>(this, _$identity);
}

abstract class _ImagesState implements ImagesState {
  const factory _ImagesState(
          {final List<ImageWithDominatingColor> imagesWithDominatingColor}) =
      _$ImagesStateImpl;

  @override
  List<ImageWithDominatingColor> get imagesWithDominatingColor;

  /// Create a copy of ImagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagesStateImplCopyWith<_$ImagesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
