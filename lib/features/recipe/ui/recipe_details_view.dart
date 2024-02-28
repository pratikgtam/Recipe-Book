import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/image.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipe = context.watch<RecipeCubit>().state.selectedRecipe;
    return CustomScaffold(
      title: recipe?.name,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (recipe?.imageUrl != null)
              CustomNetworkImage(
                imageUrl: recipe?.imageUrl,
                height: 200,
              ),
            const SizedBox(height: 20),
            Text(
              recipe?.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 5),
                Text(
                  '${recipe?.timeToPrepare ?? ''} mins',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              recipe?.description ?? '',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipe?.ingredients ?? '',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Steps',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipe?.steps ?? '',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
