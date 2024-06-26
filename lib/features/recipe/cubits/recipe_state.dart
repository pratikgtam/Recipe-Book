import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';
import 'package:recipe_book/features/recipe/models/comments_model.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/models/result.dart';

part 'recipe_state.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  factory RecipeState({
    @Default(Result<List<RecipeModel>>.empty())
    Result<List<RecipeModel>> userRecipes,
    @Default(Result<List<RecipeModel>>.empty())
    Result<List<RecipeModel>> recipes,
    @Default([]) List<RecipeModel> allRecipes,
    RecipeModel? selectedRecipe,
    @Default('All') String selectedCategory,
    ProfileModel? profile,
    @Default([]) List<RecipeModel> favoriteRecipes,
    @Default([]) List<CommentsModel> comments,
    @Default([]) List<CommentsModel> allComments,
    @Default([]) List<String> likedRecipeIds,
    @Default([]) List<String> dislikedRecipeIds,
  }) = _RecipeState;

  RecipeState._();

  bool isFavorite(RecipeModel? recipe) {
    return favoriteRecipes.contains(recipe);
  }
}
