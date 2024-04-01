import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/profile/cubits/profile_cubit.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';
import 'package:recipe_book/features/profile/views/profile_detail_view.dart';
import 'package:recipe_book/features/profile/views/profile_view.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/ui/favourite_recipe.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/app_utils.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/image.dart';
import 'package:recipe_book/shared/text_input.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  final TextEditingController _commentController = TextEditingController();
  @override
  void initState() {
    context.read<RecipeCubit>().getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeCubit>().state;
    final recipe = state.selectedRecipe;
    final profile = state.profile;
    final comments = state.comments;
    final likedRecipeIds = state.likedRecipeIds;
    final dislikedRecipeIds = state.dislikedRecipeIds;

    bool isLiked = likedRecipeIds.contains(recipe?.id);
    bool isDisliked = dislikedRecipeIds.contains(recipe?.id);

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
            const SizedBox(height: 5),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<RecipeCubit>().likeRecipe(recipe);
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color: isLiked ? Colors.blue : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<RecipeCubit>().dislikeRecipe(recipe);
                  },
                  icon: Icon(
                    Icons.thumb_down,
                    color: isDisliked ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
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
            const Text(
              'Add a comment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextInput(
              controller: _commentController,
              name: 'comment',
              hintText: 'Write a comment',
              autofocus: false,
              suffixIcon: IconButton(
                onPressed: () {
                  _ontap(profile);
                },
                icon: const Icon(
                  Icons.send,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Comments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (comments.isEmpty)
              const SizedBox(
                  height: 100, child: Center(child: Text('No comments yet'))),
            ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemCount: comments.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final comment = comments[index];
                return Dismissible(
                  key: Key(comment.id ?? ''),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Comment'),
                          content: const Text(
                              'Are you sure you want to delete this comment?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                context
                                    .read<RecipeCubit>()
                                    .deleteComment(comment);
                                Navigator.of(context).pop(true);
                                FocusScope.of(context).unfocus();
                              },
                              child: const Text('Delete'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.grey.shade200,
                    title: Text(comment.user?.fullName ?? ''),
                    subtitle: Text(comment.comment ?? ''),
                    trailing: Text(comment.createdAt?.toDisplay ?? ''),
                    leading: ProfilePic(
                      imageUrl: comment.user?.profilePic ?? '',
                      size: 30,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  void _ontap(ProfileModel? profile) {
    final profile = context.read<ProfileCubit>().state.profile.result;

    if (_commentController.text.isNotEmpty) {
      context.read<RecipeCubit>().addComment(_commentController.text, profile);
    }
    _commentController.clear();
    FocusScope.of(context).unfocus();
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
