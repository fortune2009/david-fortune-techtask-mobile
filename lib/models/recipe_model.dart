// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

List<Recipe> recipeFromJson(String str) => List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  final String title;
  final List<dynamic> ingredients;

  Recipe({
    this.title,
    this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    title: json["title"],
    ingredients: json["ingredients"] == null ? [] : List<dynamic>.from(json["ingredients"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients.map((x) => x)),
  };
}
