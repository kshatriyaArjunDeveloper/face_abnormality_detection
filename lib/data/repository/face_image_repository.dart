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

  /// Saves [FaceImageModel] in db and returns total saved images
  Future<void> saveImage(
    FaceImageModel model,
  ) async {
    await _localDataSource.saveImageModel(
      model,
    );
  }

  /// Get total [FaceImageModel] in db
  Future<int> totalImagesSaved() async =>
      await _localDataSource.getTotalSavedImages();

  /// Send to [FaceImageModel] for abnormality detection and save it to db
  Future<List<AbnormalitiesEnum>> getFaceAbnormalities(
    FaceImageModel model,
  ) async {
    await saveImage(
      model,
    );
    final abnormalities = await _service.getAbnormalities();
    await saveImage(
      FaceImageModel(
        id: model.id,
        width: model.width,
        height: model.height,
        status: AbnormalityDetectionStatusEnum.done,
        abnormalities: abnormalities,
      ),
    );
    return abnormalities;
  }

  /// List of all locally saved [FaceImageModel]
  Future<List<FaceImageModel>> getAllFaceModels() async =>
      await _localDataSource.getAllSavedImages();

  /// List of all locally saved [FaceImageModel] which is still not processed
  Future<List<FaceImageModel>> getUnProcessedFaceModels() async =>
      await _localDataSource.getUnFinishedDetectedImages();
}
