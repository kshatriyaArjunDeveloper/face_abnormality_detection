import 'package:arjunjivi/data/repository/face_image_repository.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_abnormality_detection_status_cubit.freezed.dart';
part 'face_abnormality_detection_status_state.dart';

class FaceAbnormalityDetectionStatusCubit
    extends Cubit<FaceAbnormalityDetectionStatusState> {
  FaceAbnormalityDetectionStatusCubit()
      : super(const FaceAbnormalityDetectionStatusState()) {
    showAllFaceModels();
  }

  final FaceImageRepository _repository = FaceImageRepository();

  /// Updates [_$FaceAbnormalityDetectionStatusState.faceModelList] by total saved [FaceImageModel]
  Future<void> showAllFaceModels() async {
    emit(
      state.copyWith(
        faceModelList: [],
      ),
    );
    final List<FaceImageModel> list = await _repository.getAllFaceModels();
    emit(
      state.copyWith(faceModelList: list),
    );
  }
}
