import 'package:arjunjivi/presentation/face_detection_module/face_detection_screen/face_detection_cubit.dart';
import 'package:arjunjivi/presentation/face_detection_module/face_detection_screen/face_detection_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: AppRoutes.faceDetectionScreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.faceDetectionScreen,
      builder: (context, state) => BlocProvider(
        create: (BuildContext context) {
          return FaceDetectionCubit();
        },
        child: const FaceDetectionScreen(),
      ),
    ),
  ],
);
