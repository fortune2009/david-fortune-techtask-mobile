import 'package:flutter/material.dart';
import 'package:tech_task/models/ingredients_model.dart';
import 'package:tech_task/models/recipe_model.dart';
import 'package:tech_task/services/api_services.dart';

class IngredientProvider with ChangeNotifier {

  List<Ingredients> _ingredients = [];
  List<Ingredients> get ingredients => _ingredients;

  IngredientProvider() {
    getIngredient("ingredients");
  }

  void getIngredient(String endpoints, {Map<String, String> queryParams}) async {
    _ingredients = [];
    try {
      final data = await ApiServices.getApi(endpoints, queryParams: queryParams);
      debugPrint("Properties of get data $data");
      for(int i=0; i<data.length; i++) {
        _ingredients.add(Ingredients(title: data[i]["title"], useBy: DateTime.tryParse(data[i]["use-by"])));
      }
      notifyListeners();
    } catch (e) {
      // Handle errors
      debugPrint("Error => Properties of get data $e");
    }
  }
}
