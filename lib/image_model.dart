import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class ImageModel {
  final InputImage imageData;
  final Face face;
  final XFile image;

  ImageModel({
    required this.imageData,
    required this.face,
    required this.image,
  });
}
