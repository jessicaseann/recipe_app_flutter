import 'package:flutter/material.dart';
import 'package:recipeappflutter/view_models/recipe_view_model.dart';

class RecipeList extends StatelessWidget {

  final List<RecipeViewModel> recipes; 

  RecipeList({this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.recipes.length,
      itemBuilder: (context, index) {
        
        final recipe = this.recipes[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(recipe.image)
              ),
              borderRadius: BorderRadius.circular(6)
            ),
            width: 50, 
            height: 100,
            ),
          title: Text(recipe.title),
        );
      },
    );
  }
}