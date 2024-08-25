import 'package:arjunjivi/domain/model/face_image_model.dart';

/// Tells about the detection status of [FaceImageModel]
enum AbnormalityDetectionStatusEnum {
  done,
  inProcess,
  initial,
}

extension Utility on AbnormalityDetectionStatusEnum {
  String get asString {
    switch (this) {
      case AbnormalityDetectionStatusEnum.done:
        return 'Processed';
      case AbnormalityDetectionStatusEnum.inProcess:
        return 'Processing';
      case AbnormalityDetectionStatusEnum.initial:
        return 'Still not started';
    }
  }
}