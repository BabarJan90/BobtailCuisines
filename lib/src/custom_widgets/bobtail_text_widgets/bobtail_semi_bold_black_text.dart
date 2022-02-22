import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'bobtail_base_text.dart';

class BobtailSemiBoldBlackText extends BobtailBaseText {
  const BobtailSemiBoldBlackText(
    String text, {
    Key? key,
    final Color color = BobtailCustomColors.primaryColor,
    final FontWeight fontWeight = FontWeight.w600,
  }) : super(
          key: key,
          text: text,
          color: color,
          fontWeight: fontWeight,
        );
}
