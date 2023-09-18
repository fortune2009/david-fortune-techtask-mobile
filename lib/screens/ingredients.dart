import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/providers/ingredient_provider.dart';
import 'package:tech_task/screens/recipes.dart';

class IngredientsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ingredientsProvider = Provider.of<IngredientProvider>(context);
    final ingredientsList = ingredientsProvider.ingredients;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(
              // flex: 3,
              child: ListView.builder(
                itemCount: ingredientsList.length,
                itemBuilder: (context, index) {
                  final ingredients = ingredientsList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 1),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipesScreen(),
                          ),
                        );
                      },
                      title: Text(ingredients.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                      subtitle: Text("Use by: ${DateFormat('dd MMMM yyyy').format(ingredients.useBy)}"),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
