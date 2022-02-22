import 'package:bobtail_cuisines/src/bobtail_custom_cubit/barrel.dart';
import 'package:bobtail_cuisines/src/custom_widgets/bobtail_cuisine_grid.dart';
import 'package:bobtail_cuisines/src/custom_widgets/bobtail_text_widgets/bobtail_bold_black_text_16.dart';
import 'package:bobtail_cuisines/src/custom_widgets/empty_view.dart';
import 'package:bobtail_cuisines/src/custom_widgets/error_view.dart';
import 'package:bobtail_cuisines/src/custom_widgets/filter_view.dart';
import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'cuisine_screen_cubit/barrel.dart';

class CuisineView extends StatefulWidget {
  static const id = 'CuisineView';
  const CuisineView({Key? key}) : super(key: key);

  @override
  _CuisineViewState createState() => _CuisineViewState();
}

class _CuisineViewState extends State<CuisineView> {
  String _selectedFilter = "No by default";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BobtailBoldBlackText16("BobTail"),
      ),
      drawer: const Drawer(),
      body: CubitProvider<CuisineStates, CuisineCubit>(
        create: (context) => CuisineCubit(),
        builder: (context, state, bloc) {
          return state.initializing || state.busy
              ? const Center(
                  child: CircularProgressIndicator(color: BobtailCustomColors.darkYellow))
              : state.error
                  ? Center(
                      child: ErrorView(
                          key: UniqueKey(),
                          onTap: () {
                            _selectedFilter = "No by default";
                            bloc.fetchCuisine();
                          }))
                  : CustomScrollView(
                      slivers: [
                        FilterView(
                          cuisinesList: state.cuisines!.cuisinesList!,
                          onChange: (value) {
                            _selectedFilter = value ?? _selectedFilter;
                            bloc.fetchFilteredCuisines(value ?? _selectedFilter);
                          },
                          selectedFilter: _selectedFilter,
                        ),
                        state.foods != null
                            ? BobtailCuisineGrid(
                                foods: state.foods!,
                              )
                            : const EmptyView(),
                      ],
                    );
        },
      ),
    );
  }
}
