import 'package:bobtail_cuisines/src/bobtail_custom_cubit/barrel.dart';
import 'package:bobtail_cuisines/src/screens/cuisines/models/barrel.dart';

class CuisineStates extends BobtailBaseState {
  CuisinesListModel? cuisines;
  Foods? foods;

  CuisineStates({CuisinesListModel? cuisine, Foods? food})
      : cuisines = cuisine,
        foods = food;
  CuisineStates.initializing() : super.initializing();
  CuisineStates.busy(CuisineStates oldState)
      : cuisines = oldState.cuisines,
        foods = oldState.foods,
        super.busy();
  CuisineStates.idle(CuisineStates oldState)
      : cuisines = oldState.cuisines,
        foods = oldState.foods,
        super.idle();
  CuisineStates.error(CuisineStates oldState)
      : cuisines = oldState.cuisines,
        foods = oldState.foods,
        super.error();
}

class CuisineState extends CuisineStates {
  CuisineState({required CuisinesListModel cuisines, required Foods foods})
      : super(cuisine: cuisines, food: foods);
}
