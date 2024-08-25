part of 'face_abnormality_detection_status_cubit.dart';

@freezed
class FaceAbnormalityDetectionStatusState
    with _$FaceAbnormalityDetectionStatusState {
  const factory FaceAbnormalityDetectionStatusState({
    @Default([]) List<FaceImageModel> faceModelList,
  }) = _FaceAbnormalityDetectionStatusState;
}
