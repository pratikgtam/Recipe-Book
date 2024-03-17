import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';
import 'package:recipe_book/features/profile/views/profile_detail_view.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/ui/favourite_recipe.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/image.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeCubit>().state;
    final recipe = state.selectedRecipe;
    final profile = state.profile;

    return CustomScaffold(
      title: recipe?.name,
      actions: [
        IconButton(
          onPressed: () {
            AppRoutes(context).push(const FavouriteRecipeScreen());
          },
          icon: const Icon(Icons.favorite),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RecipeCubit>().toggleFavorite(recipe);
        },
        child: Icon(
          state.isFavorite(recipe) ? Icons.favorite : Icons.favorite_border,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Profile(profile: profile),
            const SizedBox(height: 10),
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
            Wrap(
                spacing: 8,
                children: List.generate(
                    recipe?.categories.length ?? 0,
                    (index) => Chip(
                        label: Text(
                          recipe?.categories[index] ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor))),
            const SizedBox(height: 10),
            Text(
              recipe?.description ?? '',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
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

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    this.profile,
  });
  final ProfileModel? profile;
  @override
  Widget build(BuildContext context) {
    if (profile == null) return const SizedBox();
    return InkWell(
      onTap: () {
        AppRoutes(context).push(ProfileDetailView(
          profile: profile,
        ));
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          Icons.account_circle_outlined,
          size: 40,
          color: Colors.black.withOpacity(0.5),
        ),
        const SizedBox(width: 5),
        Text(
          profile?.fullName ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
