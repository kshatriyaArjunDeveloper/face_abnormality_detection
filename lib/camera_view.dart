import 'package:arjunjivi/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraView extends StatefulWidget {
  final Function(InputImage inputImage) onImage;

  const CameraView({
    super.key,
    required this.onImage,
  });

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    _startLive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCameraWidget(),
    );
  }

  // WIDGETS
  Widget _buildCameraWidget() {
    if (_controller?.value.isInitialized == false) {
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

  Future _startLive() async {
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
    widget.onImage(inputImage);
  }

  Future _stopLive() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }
}
