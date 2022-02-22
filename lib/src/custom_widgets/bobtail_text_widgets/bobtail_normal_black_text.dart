import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'bobtail_base_text.dart';

class BobtailNormalBlackText extends BobtailBaseText {
  const BobtailNormalBlackText(
    String text, {
    Key? key,
    final Color color = BobtailCustomColors.primaryColor,
  }) : super(
          key: key,
          text: text,
          color: color,
        );
}
