import 'package:flutter/material.dart';
import 'package:tech_task/models/recipe_model.dart';
import 'package:tech_task/services/api_services.dart';

class RecipeProvider with ChangeNotifier {

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  RecipeProvider() {
    getRecipe("recipes");
    ///TODO: Checking query parameters
    // getRecipe("recipes", queryParams: {"ingredients": "Hotdog"});
  }

  // final queryParams = {
  //   'ingredients': queryValue
  // };

  void getRecipe(String endpoints, {Map<String, String> queryParams}) async {
    _recipes = [];
    try {
      final data = await ApiServices.getApi(endpoints, queryParams: queryParams);
      debugPrint("Properties of get data $data");
      for(int i=0; i<data.length; i++) {
        _recipes.add(Recipe(title: data[i]["title"], ingredients: data[i]["ingredients"]));
      }
      notifyListeners();
    } catch (e) {
      // Handle errors
      debugPrint("Error => Properties of get data $e");

    }
  }
}
