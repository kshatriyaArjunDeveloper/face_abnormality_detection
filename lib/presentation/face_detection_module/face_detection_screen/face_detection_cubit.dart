import 'dart:math';

import 'package:arjunjivi/data/repository/face_image_repository.dart';
import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:arjunjivi/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

part 'face_detection_cubit.freezed.dart';
part 'face_detection_state.dart';

class FaceDetectionCubit extends Cubit<FaceDetectionState> {
  FaceDetectionCubit() : super(const FaceDetectionState());

  final FaceImageRepository _repository = FaceImageRepository();

  // STATE EMIT METHODS
  bool changeProperFaceStatus(
    List<Face> faces,
  ) {
    final bool faceStatus;
    final bool hasOneFace = faces.length == 1;
    faceStatus = hasOneFace && _checkFaceCentered(faces.first.contours);
    emit(
      state.copyWith(
        hasOneProperFace: faceStatus,
      ),
    );
    return faceStatus;
  }

  sendImageForAbnormalityDetection(
    CameraImage cameraImage,
  ) async {
    final image = cameraImage.imageFromYUV420();
    final path = await image.saveImage();
    await _repository.getFaceAbnormalities(
      FaceImageModel(
        id: path,
        status: AbnormalityDetectionStatusEnum.initial,
        abnormalities: null,
      ),
    );
  }

  // UTILITY
  bool _checkFaceCentered(
    Map<FaceContourType, FaceContour?> contours,
  ) {
    final Point<int>? rightEarMidPoint =
        contours[FaceContourType.face]?.points[27];
    final Point<int>? leftEarMidPoint =
        contours[FaceContourType.face]?.points[9];
    final Point<int>? faceTopPoint = contours[FaceContourType.face]?.points[0];
    final Point<int>? faceBottomPoint =
        contours[FaceContourType.face]?.points[18];
    final Point<int>? faceCenterPoint =
        contours[FaceContourType.noseBridge]?.points[1];

    if (rightEarMidPoint == null ||
        leftEarMidPoint == null ||
        faceTopPoint == null ||
        faceBottomPoint == null ||
        faceCenterPoint == null) {
      return false;
    } else {
      // Horizontally straight detection
      final bool earsAtSameLevel =
          (rightEarMidPoint.y - leftEarMidPoint.y).abs() < 60;

      final rightEarNoseDistance =
          (faceCenterPoint.x - rightEarMidPoint.x).abs();
      final leftEarNoseDistance = (faceCenterPoint.x - leftEarMidPoint.x).abs();
      final bool earsAtSimilarDistanceFromNose =
          (rightEarNoseDistance - leftEarNoseDistance).abs() < 60;

      // Vertically straight detection
      final faceTopToNoseDistance = (faceCenterPoint.y - faceTopPoint.y).abs();
      final faceBottomToNoseDistance =
          (faceCenterPoint.y - faceBottomPoint.y).abs();
      final bool noseAtSimilarDistanceFromFaceVerticalEdges =
          (faceTopToNoseDistance - faceBottomToNoseDistance).abs() < 60;

      return earsAtSameLevel &&
          earsAtSimilarDistanceFromNose &&
          noseAtSimilarDistanceFromFaceVerticalEdges;
    }
  }
}
