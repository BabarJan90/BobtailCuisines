import 'package:bobtail_cuisines/src/custom_widgets/bobtail_text_widgets/bobtail_normal_black_text.dart';
import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';

class BobtailOutlinedButton extends StatelessWidget {
  final String title;
  final ButtonStyle? style;
  final VoidCallback onPressed;

  const BobtailOutlinedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const BobtailNormalBlackText('LOG IN'),
      onPressed: onPressed,
      style: style ??
          OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 1,
              color: BobtailCustomColors.primaryColor,
            ),
          ),
    );
  }
}
