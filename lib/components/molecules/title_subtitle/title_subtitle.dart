import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';

class RTitleSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final double spaceBetween;

  const RTitleSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.spaceBetween = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RLabel(text: title, style: titleStyle),
        SizedBox(height: spaceBetween),
        RLabel(text: subTitle, style: subTitleStyle),
      ],
    );
  }
}
