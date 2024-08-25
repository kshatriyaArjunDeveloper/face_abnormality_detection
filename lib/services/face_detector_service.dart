import 'package:arjunjivi/data/repository/face_image_repository.dart';

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

  _start() {
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
