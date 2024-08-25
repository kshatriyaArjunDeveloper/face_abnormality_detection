import 'dart:io';

import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:arjunjivi/presentation/face_detection_module/face_abnormality_detection_status_screen/bloc/face_abnormality_detection_status_cubit.dart';
import 'package:arjunjivi/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickui/quickui.dart';

class FaceAbnormalityDetectionStatusScreen extends StatelessWidget {
  static Future<void> navigate(BuildContext context) => context.push(
        AppRoutes.faceAbnormalityDetectionStatusScreen,
      );

  const FaceAbnormalityDetectionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildFaceModelList(),
    );
  }

  // WIDGETS
  Widget _buildFaceModelList() => BlocBuilder<
          FaceAbnormalityDetectionStatusCubit,
          FaceAbnormalityDetectionStatusState>(
        builder: (context, state) {
          if (state.faceModelList.isEmpty) {
            return _loadingWidget();
          }
          return ListView.builder(
            itemCount: state.faceModelList.length,
            itemBuilder: (context, index) {
              final model = state.faceModelList[index];
              return _buildListItem(model);
            },
          );
        },
      );

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Models Status',
      ),
    );
  }

  AspectRatio _buildListItem(FaceImageModel model) {
    return AspectRatio(
      aspectRatio: 1,
      child: Row(
        children: [
          Expanded(
            child: Container_(
              borderWidth: 1,
              borderColor: Colors.black,
              color: Colors.black12,
              child: Image.file(
                File(model.id),
              ),
            ),
          ),
          Expanded(
            child: Padding_(
              verticalPadding: 20,
              child: Column(
                children: [
                  const Text(
                    'Status',
                  ),
                  Text(
                    model.status.asString,
                  ),
                  if (model.status == AbnormalityDetectionStatusEnum.done)
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See abnormalities',
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center _loadingWidget() {
    return const Center(
      child: Text('Loading Images...'),
    );
  }
}
