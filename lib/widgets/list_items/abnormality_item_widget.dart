import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class AbnormalityItemWidget extends StatelessWidget {
  late final String _abnormalityText;

  AbnormalityItemWidget({
    super.key,
    required String abnormalityText,
  }) {
    _abnormalityText = abnormalityText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalDivider(
                width: 2,
                thickness: 0.5,
                color: Colors.white,
              ),
              Expanded(
                child: Text(
                  _abnormalityText,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black26,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container_(
          shouldMakeCircle: true,
          color: Colors.white,
          width: 2,
        ),
      ],
    );
  }
}
