import 'package:flutter/material.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/image.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Welcome',
      body: Column(
        children: [
          const _BrandsList(),
          _RecipeList(recipes: [
            RecipeModel(),
            RecipeModel(),
            RecipeModel(),
            RecipeModel(),
            RecipeModel(),
            RecipeModel(),
            RecipeModel(),
            RecipeModel(),
          ]),
        ],
      ),
    );
  }
}

class _RecipeList extends StatelessWidget {
  const _RecipeList({
    required this.recipes,
  });
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: recipes.isEmpty
          ? const Center(
              child: Text(
                'No products found',
              ),
            )
          : GridView.builder(
              itemCount: recipes.length,
              padding: const EdgeInsets.only(
                right: AppConstants.horizontalScreenPadding,
                left: AppConstants.horizontalScreenPadding,
                top: 30,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 30,
                mainAxisExtent: 203,
              ),
              itemBuilder: (context, index) {
                RecipeModel recipe = recipes[index];

                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            CustomNetworkImage(
                              imageUrl: recipe.image,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipe.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                );
              }),
    );
  }
}

class _BrandsList extends StatelessWidget {
  const _BrandsList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalScreenPadding - 10),
        itemBuilder: (context, index) {
          return _HorizontalFilterItem(
            onTap: () {},
            name: 'Category $index',
            selected: false,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}

class _HorizontalFilterItem extends StatelessWidget {
  const _HorizontalFilterItem({
    required this.name,
    required this.selected,
    this.onTap,
  });
  final String name;
  final bool selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          name,
        ),
      ),
    );
  }
}
