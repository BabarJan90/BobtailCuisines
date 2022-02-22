import 'food.dart';

class Foods {
  final List<Food>? foods;

  Foods({this.foods});
  factory Foods.fromJson(List<dynamic> json) {
    List<Food> foodList = [];
    for (var element in json) {
      foodList.add(Food.fromJson(element));
    }
    return Foods(
      foods: foodList,
    );
  }

  factory Foods.filteredCuisines(List<dynamic> json, String selectedFilter) {
    List<Food> foodList = [];
    for (var element in json) {
      if (element['cuisine'] == selectedFilter) foodList.add(Food.fromJson(element));
    }
    return Foods(
      foods: foodList,
    );
  }
}
