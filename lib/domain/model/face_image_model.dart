import 'package:arjunjivi/domain/enum/abnormalities_enum.dart';
import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/utility/issar_db/issar_helper.dart';
import 'package:isar/isar.dart';

part 'face_image_model.g.dart';

@collection
@Name('FaceImageEntity')
class FaceImageModel {
  Id get isarId => fastHash(id!);

  final String id;
  @enumerated
  final AbnormalityDetectionStatusEnum status;
  @enumerated
  final List<AbnormalitiesEnum>? abnormalities;
  final double height;
  final double width;

  FaceImageModel({
    required this.id,
    required this.status,
    required this.abnormalities,
    required this.height,
    required this.width,
  });
}
