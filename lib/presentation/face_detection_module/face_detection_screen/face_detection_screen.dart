import 'package:arjunjivi/abnormalities_screen.dart';
import 'package:arjunjivi/presentation/face_detection_module/face_detection_screen/face_detection_cubit.dart';
import 'package:arjunjivi/utility.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:quickui/quickui.dart';

import '../../../image_model.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  // For face detection
  late FaceDetector _faceDetector;

  // Camera related Vars
  CameraController? _controller;
  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };
  late CameraImage _cameraImage;
  late final CameraDescription _frontCamera;

  // Status to stop or resume detection functionality
  bool _shouldDetect = false;
  bool _isDetectingInProcess = false;

  @override
  void initState() {
    super.initState();
    _selectFrontCamera().then(
      (_) {
        _startLive();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<FaceDetectionCubit, FaceDetectionState>(
          builder: (context, state) => Text(
            state.hasOneProperFace ? 'Click Pic' : 'Show Face Properly',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildCameraWidget(),
          ),
          if (_shouldDetect) _buildBottomBar()
        ],
      ),
    );
  }

  // WIDGETS
  Widget _buildCameraWidget() {
    if (_controller?.value.isInitialized == false || !_shouldDetect) {
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

  Container_ _buildBottomBar() {
    return Container_(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<FaceDetectionCubit, FaceDetectionState>(
            builder: (context, state) => IconButton(
              onPressed: state.hasOneProperFace ? _onImageClick : null,
              icon: const Icon(
                Icons.camera,
              ),
              iconSize: 40,
              color: Colors.deepOrangeAccent,
              disabledColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // METHODS

  // Camera Related

  Future<void> _selectFrontCamera() async {
    final cameras = await availableCameras();
    _frontCamera = cameras
        .where(
          (camera) => camera.lensDirection == CameraLensDirection.front,
        )
        .first;
  }

  Future _startLive() async {
    _controller = CameraController(
      _frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );
    _controller?.initialize().then(
      (_) {
        if (!mounted) {
          return;
        }
        _faceDetector = FaceDetector(
          options: FaceDetectorOptions(
            enableContours: true,
          ),
        );
        _controller?.startImageStream(_processCameraImage);
        setState(() {
          _shouldDetect = true;
          _isDetectingInProcess = false;
        });
      },
    );
  }

  Future _stopLive() async {
    setState(() {
      _shouldDetect = false;
    });
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
    _faceDetector.close();
  }

  Future<void> _onImageClick() async {
    final image = _cameraImage.imageFromYUV420();
    final path = await image.saveImage();
    final imageModel = ImageModel(
      image: image,
      path: path,
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
        _startLive();
      },
    );
  }

  // Detection Related
  Future<void> _processImage(
    InputImage inputImage,
    CameraImage image,
  ) async {
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final List<Face> faces = await _faceDetector.processImage(inputImage);
      final faceStatus =
          context.read<FaceDetectionCubit>().changeProperFaceStatus(faces);
      if (faceStatus) _cameraImage = image;
      _isDetectingInProcess = false;
    }
  }

  Future _processCameraImage(
    final CameraImage image,
  ) async {
    if (_isDetectingInProcess) return;
    _isDetectingInProcess = true;
    final sensorOrientation = _frontCamera.sensorOrientation;
    InputImageRotation? rotation;
    var rotationCompensation =
        _orientations[_controller!.value.deviceOrientation];
    rotationCompensation = (sensorOrientation + rotationCompensation!) % 360;
    rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    final plane = image.planes.first;
    final inputImage = InputImage.fromBytes(
      bytes: image.getNv21Uint8List(),
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation!, // used only in Android
        format: InputImageFormat.nv21, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
    _processImage(
      inputImage,
      image,
    );
    return;
  }
}
