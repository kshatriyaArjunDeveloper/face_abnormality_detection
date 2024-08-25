import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDbService {
  late final Isar isar;
  static final LocalDbService instance = LocalDbService._();

  LocalDbService._();

  Future<void> initializeDb() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        FaceImageModelSchema,
      ],
      directory: dir.path,
    );
  }
}
