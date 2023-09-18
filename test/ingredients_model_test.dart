

import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/models/ingredients_model.dart';

void main(){
  group("Ingredients Model Tests", () {
    test("Ingredients.fromJson should correctly parse JSON", () {
      final json = {
        "title": "Pepper",
        "use-by": "2023-09-23"
      };
      final ingredient = Ingredients.fromJson(json);
      ///Fail
      // expect(ingredient.title, "Peppermint");
      // expect(ingredient.useBy, DateTime(2023, 09, 2));
      ///pass
      expect(ingredient.title, "Pepper");
      expect(ingredient.useBy, DateTime(2023, 09, 23));
    });

    test('Ingredients.toJson should correctly serialize to JSON', () {
      final ingredient = Ingredients(title: "Curry", useBy: DateTime(2023, 9, 21));
      final json = ingredient.toJson();
      expect(json["title"], "Curry");
      expect(json["use-by"], "2023-09-21");
    });
    
  });
}