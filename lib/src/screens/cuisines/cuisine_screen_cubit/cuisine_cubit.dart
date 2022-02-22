import 'package:bobtail_cuisines/src/bobtail_custom_cubit/barrel.dart';
import 'package:bobtail_cuisines/src/services/cuisines_service.dart';
import 'package:bobtail_cuisines/src/utils/bobtail_connection_status.dart';
import 'barrel.dart';

class CuisineCubit extends BobtailBaseCubit<CuisineStates> {
  CuisineCubit() : super(CuisineStates.initializing()) {
    fetchCuisine();
  }

  CuisinesListService cuisinesListService = CuisinesListService();
  CuisinesFoodService cuisinesFoodService = CuisinesFoodService();
  CuisinesFilteredService cuisinesFilteredService = CuisinesFilteredService();

  fetchCuisine() async {
    try {
      if (await BobtailConnectionStatus.getInstance().isConnectedToInternet()) {
        emit(CuisineStates.busy(state));
        final cuisines = await cuisinesListService.getCuisinesCollectionFromFirestore();
        final foods = await cuisinesFoodService.getCuisinesFoodsCollectionFromFirestore();
        emit(CuisineState(cuisines: cuisines, foods: foods));
      } else {
        emit(CuisineStates.error(state));
      }
    } on Exception catch (error) {
      emit(CuisineStates.error(state));
    } finally {
      // No need here as emit the possible states in try and on exception
    }
  }

  fetchFilteredCuisines(String selectedCuisine) async {
    try {
      if (await BobtailConnectionStatus.getInstance().isConnectedToInternet()) {
        emit(CuisineStates.busy(state));
        final foods =
            await cuisinesFilteredService.getFilteredFoodsCollectionFromFirestore(selectedCuisine);
        emit(CuisineState(cuisines: state.cuisines!, foods: foods));
      } else {
        emit(CuisineStates.error(state));
      }
    } on Exception catch (error) {
      emit(CuisineStates.error(state));
    } finally {
      // No need here as emit the possible states in try and on exception
    }
  }
}
