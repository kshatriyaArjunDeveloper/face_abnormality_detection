import 'package:arjunjivi/home_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late final CameraDescription frontCamera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _selectFrontCamera();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

Future<void> _selectFrontCamera() async {
  final cameras = await availableCameras();
  frontCamera = cameras
      .where(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      )
      .first;
}
