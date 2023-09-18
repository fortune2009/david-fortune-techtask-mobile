import 'package:flutter/material.dart';
import 'package:tech_task/models/ingredients_model.dart';
import 'package:tech_task/models/recipe_model.dart';
import 'package:tech_task/services/api_services.dart';
import 'package:tech_task/services/interface_api_services.dart';

class IngredientProvider with ChangeNotifier {

  final IApiServices apiServices;

  List<Ingredients> _ingredients = [];
  List<Ingredients> get ingredients => _ingredients;

  IngredientProvider({this.apiServices}) {
    getIngredient("ingredients");
  }

  void getIngredient(String endpoints, {Map<String, String> queryParams}) async {
    _ingredients = [];
    try {
      final data = await apiServices.getApi(endpoints, queryParams: queryParams);
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
