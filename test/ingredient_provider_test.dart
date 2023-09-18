import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/providers/ingredient_provider.dart';
import 'package:tech_task/services/api_services.dart';

class MockApiServices extends Mock implements ApiServices {}
void main() {
  group('IngredientProvider Tests', () {
    test('getIngredient should populate ingredients list', () async {
      final apiServices = MockApiServices();
      final ingredientProvider = IngredientProvider(apiServices: apiServices);

      when(apiServices.getApi("ingredients", queryParams: null)).thenAnswer(
            (_) async => [
          {"title": "Maggi", "use-by": "2023-09-20"},
          {"title": "Salt", "use-by": "2023-09-21"},
        ],
      );

      await ingredientProvider.getIngredient("ingredients");

      expect(ingredientProvider.ingredients, hasLength(2));
      expect(ingredientProvider.ingredients[0].title, "Maggi");
      expect(ingredientProvider.ingredients[1].useBy, DateTime(2023, 9, 21));
    });
  });
}