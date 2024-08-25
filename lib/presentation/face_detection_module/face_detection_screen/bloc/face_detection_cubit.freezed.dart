// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_detection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FaceDetectionState {
  bool get hasOneProperFace => throw _privateConstructorUsedError;
  int get totalImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaceDetectionStateCopyWith<FaceDetectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceDetectionStateCopyWith<$Res> {
  factory $FaceDetectionStateCopyWith(
          FaceDetectionState value, $Res Function(FaceDetectionState) then) =
      _$FaceDetectionStateCopyWithImpl<$Res, FaceDetectionState>;
  @useResult
  $Res call({bool hasOneProperFace, int totalImages});
}

/// @nodoc
class _$FaceDetectionStateCopyWithImpl<$Res, $Val extends FaceDetectionState>
    implements $FaceDetectionStateCopyWith<$Res> {
  _$FaceDetectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasOneProperFace = null,
    Object? totalImages = null,
  }) {
    return _then(_value.copyWith(
      hasOneProperFace: null == hasOneProperFace
          ? _value.hasOneProperFace
          : hasOneProperFace // ignore: cast_nullable_to_non_nullable
              as bool,
      totalImages: null == totalImages
          ? _value.totalImages
          : totalImages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaceDetectionStateImplCopyWith<$Res>
    implements $FaceDetectionStateCopyWith<$Res> {
  factory _$$FaceDetectionStateImplCopyWith(_$FaceDetectionStateImpl value,
          $Res Function(_$FaceDetectionStateImpl) then) =
      __$$FaceDetectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasOneProperFace, int totalImages});
}

/// @nodoc
class __$$FaceDetectionStateImplCopyWithImpl<$Res>
    extends _$FaceDetectionStateCopyWithImpl<$Res, _$FaceDetectionStateImpl>
    implements _$$FaceDetectionStateImplCopyWith<$Res> {
  __$$FaceDetectionStateImplCopyWithImpl(_$FaceDetectionStateImpl _value,
      $Res Function(_$FaceDetectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasOneProperFace = null,
    Object? totalImages = null,
  }) {
    return _then(_$FaceDetectionStateImpl(
      hasOneProperFace: null == hasOneProperFace
          ? _value.hasOneProperFace
          : hasOneProperFace // ignore: cast_nullable_to_non_nullable
              as bool,
      totalImages: null == totalImages
          ? _value.totalImages
          : totalImages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FaceDetectionStateImpl implements _FaceDetectionState {
  const _$FaceDetectionStateImpl(
      {this.hasOneProperFace = false, this.totalImages = 0});

  @override
  @JsonKey()
  final bool hasOneProperFace;
  @override
  @JsonKey()
  final int totalImages;

  @override
  String toString() {
    return 'FaceDetectionState(hasOneProperFace: $hasOneProperFace, totalImages: $totalImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceDetectionStateImpl &&
            (identical(other.hasOneProperFace, hasOneProperFace) ||
                other.hasOneProperFace == hasOneProperFace) &&
            (identical(other.totalImages, totalImages) ||
                other.totalImages == totalImages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasOneProperFace, totalImages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceDetectionStateImplCopyWith<_$FaceDetectionStateImpl> get copyWith =>
      __$$FaceDetectionStateImplCopyWithImpl<_$FaceDetectionStateImpl>(
          this, _$identity);
}

abstract class _FaceDetectionState implements FaceDetectionState {
  const factory _FaceDetectionState(
      {final bool hasOneProperFace,
      final int totalImages}) = _$FaceDetectionStateImpl;

  @override
  bool get hasOneProperFace;
  @override
  int get totalImages;
  @override
  @JsonKey(ignore: true)
  _$$FaceDetectionStateImplCopyWith<_$FaceDetectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
