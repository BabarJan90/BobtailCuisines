import 'package:flutter/material.dart';

class BobtailCuisinePlaceholder extends StatelessWidget {
  final bool isCircular;
  const BobtailCuisinePlaceholder({Key? key, this.isCircular = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isCircular ? 50 : 0),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
