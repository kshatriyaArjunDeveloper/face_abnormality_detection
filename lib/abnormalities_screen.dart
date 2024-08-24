import 'dart:io';

import 'package:arjunjivi/image_model.dart';
import 'package:flutter/material.dart';

class AbnormalitiesScreen extends StatefulWidget {
  late final ImageModel _imageModel;

  AbnormalitiesScreen({
    super.key,
    required ImageModel imageModel,
  }) {
    _imageModel = imageModel;
  }

  @override
  State<AbnormalitiesScreen> createState() => _AbnormalitiesScreenState();
}

class _AbnormalitiesScreenState extends State<AbnormalitiesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Abnormality Details',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              File(
                '/data/user/0/com.example.arjunjivi/app_flutter/saved_image.jpg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
