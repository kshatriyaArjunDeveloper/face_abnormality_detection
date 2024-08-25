import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:arjunjivi/presentation/face_detection_module/abnormalities_screen/abnormalities_screen.dart';
import 'package:arjunjivi/presentation/face_detection_module/face_abnormality_detection_status_screen/bloc/face_abnormality_detection_status_cubit.dart';
import 'package:arjunjivi/router/app_routes.dart';
import 'package:arjunjivi/widgets/list_items/face_image_with_status_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// This screen shows all locally saved [FaceImageModel] abnormality details and status
///
/// Functionalities
/// * Refresh status of all locally saved [FaceImageModel]
/// * Go to [AbnormalitiesScreen] to see Abnormalities if
/// [FaceImageModel.status] is [AbnormalityDetectionStatusEnum.done]
class FaceAbnormalityDetectionStatusScreen extends StatelessWidget {
  static Future<void> navigate(BuildContext context) => context.push(
        AppRoutes.faceAbnormalityDetectionStatusScreen,
      );

  const FaceAbnormalityDetectionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(
        context,
      ),
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
              return _buildListItem(
                model,
                context,
              );
            },
          );
        },
      );

  AppBar _buildAppBar(
    BuildContext context,
  ) {
    return AppBar(
      title: const Text(
        'Models Status',
      ),
      actions: [
        IconButton(
          onPressed: () {
            context
                .read<FaceAbnormalityDetectionStatusCubit>()
                .showAllFaceModels();
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  AspectRatio _buildListItem(
    FaceImageModel model,
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: 1,
      child: FaceImageWithStatusItem(
        model: model,
        onClick: () {
          AbnormalitiesScreen.navigate(
            context,
            model,
          );
        },
      ),
    );
  }

  Center _loadingWidget() {
    return const Center(
      child: Text('No Images....'),
    );
  }
}
