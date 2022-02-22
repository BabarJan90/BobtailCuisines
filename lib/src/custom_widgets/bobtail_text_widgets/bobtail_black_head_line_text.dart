import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'bobtail_base_text.dart';

class BobtailBlackHeadLineText extends BobtailBaseText {
  const BobtailBlackHeadLineText(
    String text, {
    Key? key,
    final TextStyle? style,
  }) : super(
          key: key,
          text: text,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: BobtailFontSizes.fontSize24,
          style: style,
        );
}
