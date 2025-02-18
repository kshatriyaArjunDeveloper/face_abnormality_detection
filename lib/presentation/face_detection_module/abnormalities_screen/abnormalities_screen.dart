import 'dart:io';
import 'dart:math';

import 'package:arjunjivi/domain/enum/abnormalities_enum.dart';
import 'package:arjunjivi/domain/model/face_image_model.dart';
import 'package:arjunjivi/router/app_routes.dart';
import 'package:arjunjivi/widgets/list_items/abnormality_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

/// This screen shows the abnormalities on a face image.
///
/// Functionalities
/// * Show abnormalities from [FaceImageModel] taken as param.
class AbnormalitiesScreen extends StatefulWidget {
  static navigate(
    BuildContext context,
    FaceImageModel faceModel,
  ) =>
      context.push(
        AppRoutes.abnormalitiesScreen,
        extra: faceModel,
      );

  late final FaceImageModel _imageModel;

  AbnormalitiesScreen({
    super.key,
    required FaceImageModel faceModel,
  }) {
    _imageModel = faceModel;
  }

  @override
  State<AbnormalitiesScreen> createState() => _AbnormalitiesScreenState();
}

class _AbnormalitiesScreenState extends State<AbnormalitiesScreen> {
  final GlobalKey _imageKey = GlobalKey();
  late final _height;
  late final _width;
  final List<AbnormalityUiModel> _abnormalities = [];
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );
  File? _imageFile;

  @override
  void initState() {
    super.initState();

    _imageFile = File(widget._imageModel.id);
    Future.delayed(const Duration(milliseconds: 300)).then(
      (value) async {
        _getImageHeight();
        _makeAbnormalities();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Stack(
            children: [
               _buildImage(),
              if (_abnormalities.isNotEmpty) ..._buildAbnormalitiesWidgetList(),
              if (_abnormalities.isEmpty) _buildLoading(),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  } // WIDGETS

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Abnormality Details',
      ),
    );
  }

  Image _buildImage() {
    return Image.file(
      _imageFile!,
      key: _imageKey,
    );
  }

  List<Positioned> _buildAbnormalitiesWidgetList() {
    return List.generate(
      _abnormalities.length,
      (index) {
        final AbnormalityUiModel model = _abnormalities[index];
        return _buildPositionedAbnormality(
          model,
          index,
        );
      },
    );
  }

  Positioned _buildPositionedAbnormality(
    AbnormalityUiModel model,
    int index,
  ) {
    return Positioned(
      left: model.x,
      bottom: _height - model.y,
      top: index * 16,
      right: 0,
      child: AbnormalityItemWidget(
        abnormalityText: model.abnormality,
      ),
    );
  }

  Positioned _buildLoading() {
    return const Positioned(
      top: 12,
      left: 0,
      right: 0,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }

  // METHODS

  void _getImageHeight() {
    final RenderBox renderBox =
        _imageKey.currentContext?.findRenderObject() as RenderBox;
    _width = renderBox.size.width;
    _height = renderBox.size.height;
  }

  Future<void> _makeAbnormalities() async {
    final List<AbnormalitiesEnum> abnormalities =
        widget._imageModel.abnormalities!;

    final inputImage = InputImage.fromFile(_imageFile!);
    final Face face = await _processImage(inputImage);

    List<AbnormalityUiModel> newAbnormalitiesModelList = [];

    for (var abnormality in abnormalities) {
      final AbnormalityUiModel model = AbnormalityUiModel(
        abnormalityEnum: abnormality,
        contours: face.contours,
        imageSize: Size(
          widget._imageModel.width,
          widget._imageModel.height,
        ),
        viewSize: Size(
          _width,
          _height,
        ),
      );

      newAbnormalitiesModelList.add(model);
    }

    setState(() {
      _abnormalities.clear();
      _abnormalities.addAll(newAbnormalitiesModelList);
    });
  }

  Future<Face> _processImage(
    InputImage inputImage,
  ) async {
    final List<Face> faces = await _faceDetector.processImage(inputImage);
    return faces.first;
  }
}

/// UI model for showing abnormalities on face image.
///
/// * [x] & [y] is point of abnormality on image from [FaceImageModel]
/// * [abnormality] is the name of abnormality shown on image.
class AbnormalityUiModel {
  late final double x;
  late final double y;
  late final String abnormality;

  AbnormalityUiModel({
    required AbnormalitiesEnum abnormalityEnum,
    required Map<FaceContourType, FaceContour?> contours,
    required Size imageSize,
    required Size viewSize,
  }) {
    final widthRatio = viewSize.width / imageSize.width;
    final heightRatio = viewSize.height / imageSize.height;

    switch (abnormalityEnum) {
      case AbnormalitiesEnum.foreheadWrinkles:
        {
          abnormality = 'Wrinkles';
          final Point<int> foreheadPoint =
              contours[FaceContourType.face]!.points[0];
          x = foreheadPoint.x * widthRatio;
          y = foreheadPoint.y * heightRatio;
        }
        break;
      case AbnormalitiesEnum.leftEyeFineLines:
        {
          abnormality = 'Eye Fine Lines';
          final Point<int> leftEyeData =
              contours[FaceContourType.leftEye]!.points[12];
          final Point<int> noseBridgeData =
              contours[FaceContourType.noseBridge]!.points[1];
          x = leftEyeData.x * widthRatio;
          y = (leftEyeData.y + ((leftEyeData.y - noseBridgeData.y) / 2).abs()) *
              heightRatio;
        }
        break;
      case AbnormalitiesEnum.rightMidCheekPores:
        {
          abnormality = 'Pores';
          final Point<int> foreheadPoint =
          contours[FaceContourType.face]!.points[27];
          final Point<int> noseBottomData =
          contours[FaceContourType.noseBottom]!.points[0];
          x = (foreheadPoint.x + ((foreheadPoint.x - noseBottomData.x) / 2).abs()) *
              widthRatio;
          y = (foreheadPoint.y + ((foreheadPoint.y - noseBottomData.y) / 2).abs()) *
              heightRatio;
        }
        break;
      case AbnormalitiesEnum.bottomRightLipFirmness:
        {
          abnormality = 'Firmness';
          final Point<int> lowerLipBottomPoint =
          contours[FaceContourType.lowerLipBottom]!.points[1];
          x = lowerLipBottomPoint.x * widthRatio;
          y = lowerLipBottomPoint.y * heightRatio;
        }
        break;
    }
  }
}
