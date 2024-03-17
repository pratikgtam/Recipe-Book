import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/ui/recipe_list.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';

class FavouriteRecipeScreen extends StatelessWidget {
  const FavouriteRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteRecipe = context.watch<RecipeCubit>().state.favoriteRecipes;
    return CustomScaffold(
      title: 'Favourite Recipes',
      body: RecipeList(
        recipes: favouriteRecipe,
      ),
    );
  }
}
