import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'bobtail_base_text.dart';

class BobtailBoldBlackText extends BobtailBaseText {
  const BobtailBoldBlackText(
    String text, {
    Key? key,
    final Color color = BobtailCustomColors.primaryColor,
    final FontWeight fontWeight = FontWeight.bold,
  }) : super(
          key: key,
          text: text,
          color: color,
          fontWeight: fontWeight,
          fontSize: BobtailFontSizes.fontSize16,
        );
}
