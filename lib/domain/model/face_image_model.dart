import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/services/abnormality_detector_service.dart';
import 'package:isar/isar.dart';

part 'face_image_model.g.dart';

@collection
@Name('FaceImageEntity')
class FaceImageModel {
  final Id? id;
  final String imagePath;
  @enumerated
  final AbnormalityDetectionStatus status;
  @enumerated
  final List<AbnormalitiesEnum>? abnormalities;

  FaceImageModel({
    this.id,
    required this.imagePath,
    required this.status,
    required this.abnormalities,
  });
}
