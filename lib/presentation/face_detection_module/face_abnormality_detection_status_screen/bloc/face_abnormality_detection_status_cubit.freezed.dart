// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_abnormality_detection_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FaceAbnormalityDetectionStatusState {
  List<FaceImageModel> get faceModelList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaceAbnormalityDetectionStatusStateCopyWith<
          FaceAbnormalityDetectionStatusState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceAbnormalityDetectionStatusStateCopyWith<$Res> {
  factory $FaceAbnormalityDetectionStatusStateCopyWith(
          FaceAbnormalityDetectionStatusState value,
          $Res Function(FaceAbnormalityDetectionStatusState) then) =
      _$FaceAbnormalityDetectionStatusStateCopyWithImpl<$Res,
          FaceAbnormalityDetectionStatusState>;
  @useResult
  $Res call({List<FaceImageModel> faceModelList});
}

/// @nodoc
class _$FaceAbnormalityDetectionStatusStateCopyWithImpl<$Res,
        $Val extends FaceAbnormalityDetectionStatusState>
    implements $FaceAbnormalityDetectionStatusStateCopyWith<$Res> {
  _$FaceAbnormalityDetectionStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceModelList = null,
  }) {
    return _then(_value.copyWith(
      faceModelList: null == faceModelList
          ? _value.faceModelList
          : faceModelList // ignore: cast_nullable_to_non_nullable
              as List<FaceImageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaceAbnormalityDetectionStatusStateImplCopyWith<$Res>
    implements $FaceAbnormalityDetectionStatusStateCopyWith<$Res> {
  factory _$$FaceAbnormalityDetectionStatusStateImplCopyWith(
          _$FaceAbnormalityDetectionStatusStateImpl value,
          $Res Function(_$FaceAbnormalityDetectionStatusStateImpl) then) =
      __$$FaceAbnormalityDetectionStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FaceImageModel> faceModelList});
}

/// @nodoc
class __$$FaceAbnormalityDetectionStatusStateImplCopyWithImpl<$Res>
    extends _$FaceAbnormalityDetectionStatusStateCopyWithImpl<$Res,
        _$FaceAbnormalityDetectionStatusStateImpl>
    implements _$$FaceAbnormalityDetectionStatusStateImplCopyWith<$Res> {
  __$$FaceAbnormalityDetectionStatusStateImplCopyWithImpl(
      _$FaceAbnormalityDetectionStatusStateImpl _value,
      $Res Function(_$FaceAbnormalityDetectionStatusStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceModelList = null,
  }) {
    return _then(_$FaceAbnormalityDetectionStatusStateImpl(
      faceModelList: null == faceModelList
          ? _value._faceModelList
          : faceModelList // ignore: cast_nullable_to_non_nullable
              as List<FaceImageModel>,
    ));
  }
}

/// @nodoc

class _$FaceAbnormalityDetectionStatusStateImpl
    implements _FaceAbnormalityDetectionStatusState {
  const _$FaceAbnormalityDetectionStatusStateImpl(
      {final List<FaceImageModel> faceModelList = const []})
      : _faceModelList = faceModelList;

  final List<FaceImageModel> _faceModelList;
  @override
  @JsonKey()
  List<FaceImageModel> get faceModelList {
    if (_faceModelList is EqualUnmodifiableListView) return _faceModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faceModelList);
  }

  @override
  String toString() {
    return 'FaceAbnormalityDetectionStatusState(faceModelList: $faceModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceAbnormalityDetectionStatusStateImpl &&
            const DeepCollectionEquality()
                .equals(other._faceModelList, _faceModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_faceModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceAbnormalityDetectionStatusStateImplCopyWith<
          _$FaceAbnormalityDetectionStatusStateImpl>
      get copyWith => __$$FaceAbnormalityDetectionStatusStateImplCopyWithImpl<
          _$FaceAbnormalityDetectionStatusStateImpl>(this, _$identity);
}

abstract class _FaceAbnormalityDetectionStatusState
    implements FaceAbnormalityDetectionStatusState {
  const factory _FaceAbnormalityDetectionStatusState(
          {final List<FaceImageModel> faceModelList}) =
      _$FaceAbnormalityDetectionStatusStateImpl;

  @override
  List<FaceImageModel> get faceModelList;
  @override
  @JsonKey(ignore: true)
  _$$FaceAbnormalityDetectionStatusStateImplCopyWith<
          _$FaceAbnormalityDetectionStatusStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
