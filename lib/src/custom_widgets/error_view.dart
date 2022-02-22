import 'package:bobtail_cuisines/src/custom_widgets/bobtail_text_widgets/bobtail_bold_black_text_16.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onTap;
  final String errorMessage;
  const ErrorView(
      {Key? key, required this.onTap, this.errorMessage = 'Poor Network/Some Thing Wrong'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              color: Colors.red,
              size: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            BobtailBoldBlackText16(errorMessage),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.refresh,
                color: Colors.red,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
