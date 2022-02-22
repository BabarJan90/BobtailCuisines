import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BobtailBaseText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final TextStyle? style;
  const BobtailBaseText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = BobtailFontSizes.fontSize12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.overflow = TextOverflow.visible,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        textStyle: style ??
            Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: fontSize,
                  color: color,
                  fontWeight: fontWeight,
                  fontStyle: FontStyle.italic,
                ),
      ),
    );
  }
}
