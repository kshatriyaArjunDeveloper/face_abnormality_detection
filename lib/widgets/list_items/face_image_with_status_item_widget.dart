import 'dart:io';

import 'package:arjunjivi/domain/enum/abnormality_detection_status.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

/// An widget shows face image with status of abnormality detection and if
/// detected and option to do [onClick]
///
/// Takes [FaceImageModel] to show image, status,
/// based on [FaceImageModel.status] if is [AbnormalityDetectionStatusEnum.done]
/// option to [onClick]
class FaceImageWithStatusItem extends StatelessWidget {
  late final FaceImageModel _model;
  late final VoidCallback _onClick;

  FaceImageWithStatusItem({
    super.key,
    required FaceImageModel model,
    required VoidCallback onClick,
  }) {
    _model = model;
    _onClick = onClick;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container_(
            borderWidth: 1,
            borderColor: Colors.black,
            color: Colors.black12,
            child: Image.file(
              File(_model.id),
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
                  _model.status.asString,
                ),
                if (_model.status == AbnormalityDetectionStatusEnum.done)
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: _onClick,
                        child: const Text(
                          'See abnormalities',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
