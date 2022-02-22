import 'package:bobtail_cuisines/src/screens/cuisines/models/barrel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BobtailCuisinesBaseService {
  CollectionReference cuisinesRef = FirebaseFirestore.instance.collection('cuisines');

  Future getTheDocumentData({String docName = 'ay2LJG2RbHLE3I9OU66k'}) async {
    DocumentSnapshot documentSnapshot = await cuisinesRef.doc(docName).get();
    final data = documentSnapshot.data() as Map;
    return data;
  }
}

class CuisinesListService extends BobtailCuisinesBaseService {
  CuisinesListService() : super();
  Future<CuisinesListModel> getCuisinesCollectionFromFirestore() async {
    final data = await getTheDocumentData(docName: 'ay2LJG2RbHLE3I9OU66k');
    final cuisinesList = data['cuisines_list'];
    return CuisinesListModel.fromJson(cuisinesList);
  }
}

class CuisinesFoodService extends BobtailCuisinesBaseService {
  CuisinesFoodService() : super();
  Future<Foods> getCuisinesFoodsCollectionFromFirestore() async {
    final data = await getTheDocumentData(docName: 'foods');
    final foods = data['foods'];
    return Foods.fromJson(foods);
  }
}

class CuisinesFilteredService extends BobtailCuisinesBaseService {
  CuisinesFilteredService() : super();
  Future<Foods> getFilteredFoodsCollectionFromFirestore(String selectedCuisine) async {
    final data = await getTheDocumentData(docName: 'foods');
    final foods = data['foods'];
    return Foods.filteredCuisines(foods, selectedCuisine);
  }
}
