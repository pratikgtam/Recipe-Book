import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/features/recipe/ui/recipe_details_view.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/image.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.recipes,
    this.gridView = true,
    this.isFavorite = false,
  });
  final List<RecipeModel> recipes;
  final bool gridView;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: recipes.isEmpty
          ? const Center(
              child: Text(
                'No products found',
              ),
            )
          : gridView
              ? GridView.builder(
                  itemCount: recipes.length,
                  padding: const EdgeInsets.only(
                    right: AppConstants.horizontalScreenPadding,
                    left: AppConstants.horizontalScreenPadding,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 203,
                  ),
                  itemBuilder: (context, index) {
                    RecipeModel recipe = recipes[index];

                    return _Recipe(recipe: recipe);
                  })
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: recipes.length,
                  padding: const EdgeInsets.only(
                    right: AppConstants.horizontalScreenPadding,
                    left: AppConstants.horizontalScreenPadding,
                  ),
                  itemBuilder: (context, index) {
                    RecipeModel recipe = recipes[index];

                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        _Recipe(recipe: recipe),
                        if (isFavorite)
                          Container(
                            margin: const EdgeInsets.all(
                              4,
                            ),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<RecipeCubit>()
                                    .toggleFavorite(recipe);
                              },
                              icon: const Icon(
                                size: 22,
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
    );
  }
}

class _Recipe extends StatelessWidget {
  const _Recipe({
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<RecipeCubit>().setSelectedRecipe(recipe);
        AppRoutes(context).push(const RecipeDetailsPage());
      },
      child: SizedBox(
        height: 203,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CustomNetworkImage(
                    width: double.infinity,
                    imageUrl: recipe.imageUrl,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  recipe.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${recipe.timeToPrepare ?? ''} mins',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  recipe.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
