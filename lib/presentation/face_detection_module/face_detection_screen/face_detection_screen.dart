import 'package:arjunjivi/presentation/face_detection_module/face_abnormality_detection_status_screen/face_abnormality_detection_status_screen.dart';
import 'package:arjunjivi/presentation/face_detection_module/face_detection_screen/bloc/face_detection_cubit.dart';
import 'package:arjunjivi/utility/camera/camera_extension.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:quickui/quickui.dart';

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
        title: BlocConsumer<FaceDetectionCubit, FaceDetectionState>(
          listener: (context, state) async {
            if (state.totalImages > 10) {
              await _stopLive();
              FaceAbnormalityDetectionStatusScreen.navigate(context).then(
                (value) {
                  _startLive();
                },
              );
            }
          },
          listenWhen: (previous, current) =>
              previous.totalImages != current.totalImages,
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
        children: [
          Expanded(
            child: BlocBuilder<FaceDetectionCubit, FaceDetectionState>(
              buildWhen: (previous, current) =>
                  previous.totalImages != current.totalImages,
              builder: (context, state) => Padding_(
                leftPadding: 8,
                child: Text(
                  'Click ${10 - state.totalImages} more images',
                ),
              ),
            ),
          ),
          BlocBuilder<FaceDetectionCubit, FaceDetectionState>(
            buildWhen: (previous, current) =>
                previous.hasOneProperFace != current.hasOneProperFace,
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

  void _onImageClick() {
    context.read<FaceDetectionCubit>().sendImageForAbnormalityDetection(
          _cameraImage,
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
