import 'package:flutter/material.dart';
import 'bobtail_text_widgets/bobtail_bold_black_text.dart';

class FilterView extends StatelessWidget {
  final List<String> cuisinesList;
  final ValueChanged onChange;
  final String selectedFilter;
  const FilterView(
      {Key? key, required this.cuisinesList, required this.onChange, required this.selectedFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 60.0,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cuisinesList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Radio<String>(
                      value: cuisinesList[index],
                      groupValue: selectedFilter,
                      onChanged: onChange,
                      fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
                    ),
                    BobtailBoldBlackText(cuisinesList[index]),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
