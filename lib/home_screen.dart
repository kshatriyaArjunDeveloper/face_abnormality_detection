import 'dart:io';
import 'dart:math';

import 'package:arjunjivi/abnormalities_screen.dart';
import 'package:arjunjivi/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickui/quickui.dart';

import 'image_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _faceStatus = false;
  bool _canRunDetection = true;
  late InputImage _inputImage;
  late Face _face;
  FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    _startLive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _faceStatus ? 'Click Pic' : 'Show Face Properly',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildCameraWidget(),
          ),
          if (_canRunDetection)
            Container_(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _faceStatus ? _onImageClick : null,
                    icon: const Icon(
                      Icons.camera,
                    ),
                    iconSize: 40,
                    color: Colors.deepOrangeAccent,
                    disabledColor: Colors.grey,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  // WIDGETS
  Widget _buildCameraWidget() {
    if (_controller?.value.isInitialized == false || !_canRunDetection) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    //to prevent scaling down, inert the value
    if (scale < 1) scale = 1 / scale;
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(_controller!),
            ),
          ),
        ],
      ),
    );
  }

  // METHODS

  // Camera Related
  Future _startLive() async {
    _canRunDetection = true;
    _controller = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller?.initialize().then(
      (_) {
        if (!mounted) {
          return;
        }

        _controller?.startImageStream(_processCameraImage);
        setState(() {});
      },
    );
  }

  Future<void> _onImageClick() async {
    final image = await _controller?.takePicture();
    if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      String datePath =
          DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now());
      final String imageFilePath = '${directory.path}/$datePath.jpg';
      final File savedImage = File(image.path);
      await savedImage.copy(imageFilePath);
      print('Image saved to $imageFilePath');

      final imageModel = ImageModel(
        image: image,
        face: _face,
        imageData: _inputImage,
      );

      await _stopLive();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AbnormalitiesScreen(
            imageModel: imageModel,
          ),
        ),
      ).then(
        (value) {
          _canRunDetection = true;
          if (mounted) {
            _faceDetector = FaceDetector(
              options: FaceDetectorOptions(
                enableContours: true,
                enableLandmarks: true,
              ),
            );
            _controller?.startImageStream(_processCameraImage);
          }
          setState(() {});
        },
      );
    }
  }

  Future _stopLive() async {
    _canRunDetection = false;
    if (mounted) {
      await _faceDetector.close();
      await _controller?.stopImageStream();
    }
  }

  // Detection Related
  void _logDetection(List<Face> faces) {
    // print('.....');
    // print('Total Faces: ${faces.length}');
    // print('.....');
    if (mounted) {
      setState(() {
        final bool hasOneFace = faces.length == 1;
        if (hasOneFace) {
          print('Face contours: ${faces.first.contours}');
          _faceStatus = hasOneFace && _checkFaceCentered(faces.first.contours);
        } else {
          _faceStatus = false;
        }
      });
    }
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final List<Face> faces = await _faceDetector.processImage(inputImage);
      if (faces.isNotEmpty) {
        _face = faces.first;
        _inputImage = inputImage;
      }
      _logDetection(faces);
    }
  }

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

  Future _processCameraImage(
    final CameraImage image,
  ) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    final Size imageSize = Size(
      image.width.toDouble(),
      image.height.toDouble(),
    );

    final imageRotation =
        InputImageRotationValue.fromRawValue(frontCamera.sensorOrientation) ??
            InputImageRotation.rotation0deg;
    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw) ??
            InputImageFormat.nv21;

    final planeData = image.planes.map((final Plane plane) {
      return InputImageMetadata(
        bytesPerRow: plane.bytesPerRow,
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat,
      );
    }).toList();

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: planeData.first,
    );
    _processImage(inputImage);
  }
}
