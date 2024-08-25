import 'package:arjunjivi/data/repository/face_image_repository.dart';
import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';

/// Service to start abnormality detection of [FaceImageModel] for all locally
/// saved models with [FaceImageModel.status] of [AbnormalityDetectionStatusEnum.inProcess] & [AbnormalityDetectionStatusEnum.initial]
class FaceDetectorService {
  // Making Singleton
  FaceDetectorService._() {
    _faceImageRepository = FaceImageRepository();
    _start();
  }

  static FaceDetectorService? _instance;

  /// Singleton constructor for [FaceDetectorService]
  factory FaceDetectorService() {
    _instance ??= FaceDetectorService._();
    return _instance!;
  }

  late final FaceImageRepository _faceImageRepository;

  /// Restarts abnormality detection of [FaceImageModel] for all locally
  /// saved models with [FaceImageModel.status] of
  /// [AbnormalityDetectionStatusEnum.inProcess] & [AbnormalityDetectionStatusEnum.initial]
  void _start() {
    _faceImageRepository.getUnProcessedFaceModels().then(
      (list) {
        list.forEach(
          (model) {
            _faceImageRepository.getFaceAbnormalities(model);
          },
        );
      },
    );
  }
}
