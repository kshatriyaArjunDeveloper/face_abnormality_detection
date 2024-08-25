import 'package:arjunjivi/face_detection_screen.dart';
import 'package:arjunjivi/services/local_db_service.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDbService.instance.initializeDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FaceDetectionScreen(),
    );
  }
}