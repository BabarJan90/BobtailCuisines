import 'package:bobtail_cuisines/src/screens/cuisines/models/foods.dart';
import 'package:flutter/material.dart';
import 'bobtail_cuisine_circular_image.dart';
import 'bobtail_text_widgets/barrel.dart';

class BobtailCuisineGrid extends StatelessWidget {
  final Foods foods;
  const BobtailCuisineGrid({Key? key, required this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BobtailCuisineCircularImage(
                  url: foods.foods![index].imageURL,
                  size: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: BobtailSemiBoldBlackText(foods.foods![index].foodName ?? '')),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: BobtailNormalBlackText(foods.foods![index].cuisineName ?? '')),
              ],
            );
          },
          childCount: foods.foods!.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.0,
        ),
      ),
    );
  }
}
