part of 'face_detection_cubit.dart';

@freezed
class FaceDetectionState with _$FaceDetectionState {
  const factory FaceDetectionState({
    @Default(false) bool hasOneProperFace,
  }) = _FaceDetectionState;
}
