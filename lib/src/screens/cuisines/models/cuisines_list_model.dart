class CuisinesListModel {
  List<String>? cuisinesList;
  CuisinesListModel({this.cuisinesList});

  factory CuisinesListModel.fromJson(List<dynamic> json) {
    List<String> cuisines = [];
    for (var element in json) {
      cuisines.add(element);
    }

    return CuisinesListModel(
      cuisinesList: cuisines,
    );
  }
}
