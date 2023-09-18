import 'package:flutter/material.dart';
import 'package:tech_task/models/recipe_model.dart';
import 'package:tech_task/services/api_services.dart';
import 'package:tech_task/services/interface_api_services.dart';

class RecipeProvider with ChangeNotifier {
  final IApiServices apiServices;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  RecipeProvider({this.apiServices}) {
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
      final data = await apiServices.getApi(endpoints, queryParams: queryParams);
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
