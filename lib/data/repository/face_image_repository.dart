import 'package:arjunjivi/data/data_source/local_data_source/face_image_local_data_source.dart';
import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:arjunjivi/services/abnormality_detector_service.dart';

class FaceImageRepository {
  final FaceImageLocalDataSource _localDataSource = FaceImageLocalDataSource();
  final AbnormalityDetectorService _service = AbnormalityDetectorService();

  // Making Singleton
  FaceImageRepository._();

  static FaceImageRepository? _instance;

  factory FaceImageRepository() {
    _instance ??= FaceImageRepository._();
    return _instance!;
  }

  Future<List<AbnormalitiesEnum>> getFaceAbnormalities(
    FaceImageModel model,
  ) async {
    await _localDataSource.saveImageModel(
      FaceImageModel(
        id: model.id,
        status: AbnormalityDetectionStatusEnum.inProcess,
        abnormalities: null,
      ),
    );
    final abnormalities = await _service.getAbnormalities();
    await _localDataSource.saveImageModel(
      FaceImageModel(
        id: model.id,
        status: AbnormalityDetectionStatusEnum.done,
        abnormalities: abnormalities,
      ),
    );
    return abnormalities;
  }
}
