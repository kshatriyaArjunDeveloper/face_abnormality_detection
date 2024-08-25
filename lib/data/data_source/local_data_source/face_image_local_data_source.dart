import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:arjunjivi/services/local_db_service.dart';
import 'package:isar/isar.dart';

class FaceImageLocalDataSource {
  final IsarCollection<FaceImageModel> _isarFaceImage =
      LocalDbService.instance.isar.faceImageModels;

  // Making Singleton
  FaceImageLocalDataSource._();

  static FaceImageLocalDataSource? _instance;

  factory FaceImageLocalDataSource() {
    _instance ??= FaceImageLocalDataSource._();
    return _instance!;
  }

  Future<void> saveImageModel(
    FaceImageModel model,
  ) async =>
      await _isarFaceImage.isar.writeTxn(
        () async {
          await _isarFaceImage.put(model);
        },
      );

  Future<int> getTotalSavedImages() async => await _isarFaceImage.count();

  Future<List<FaceImageModel>> getAllSavedImages() async =>
      await _isarFaceImage.where().findAll();

  Future<List<FaceImageModel>> getUnFinishedDetectedImages() async =>
      await _isarFaceImage
          .filter()
          .not()
          .statusEqualTo(AbnormalityDetectionStatusEnum.done)
          .findAll();
}
