import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/models/recipe_model.dart';
import 'package:tech_task/providers/recipe_provider.dart';

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final recipeProvider = Provider.of<RecipeProvider>(context);
    final recipeList = recipeProvider.recipes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Expanded(
            // flex: 3,
            child: ListView.builder(
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                final recipe = recipeList[index];
                return ListTile(
                  onTap: () {

                },
                  title: Text(recipe.title),
                  subtitle: Text(recipe.ingredients.join(', ')),
                );
              },
            ),
          ),
          // SizedBox(height: 20),
        ],
      ),
    );
  }
}
