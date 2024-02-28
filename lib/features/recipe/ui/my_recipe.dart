import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/ui/recipe_list.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';

class MyRecipe extends StatefulWidget {
  const MyRecipe({super.key});

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  bool _gridView = true;
  @override
  void initState() {
    super.initState();
    context.read<RecipeCubit>().getMyRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeCubit>().state.userRecipes;

    return CustomScaffold(
      title: 'My Recipe',
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _gridView = !_gridView;
            });
          },
          icon: Icon(
            _gridView ? Icons.list : Icons.grid_view,
          ),
        ),
      ],
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RecipeList(
              recipes: state.result ?? [],
              gridView: _gridView,
            ),
    );
  }
}
