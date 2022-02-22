import 'package:bobtail_cuisines/src/custom_widgets/bobtail_text_widgets/bobtail_semi_bold_black_text.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: BobtailSemiBoldBlackText("No Cuisine Available"),
      ),
    );
  }
}
