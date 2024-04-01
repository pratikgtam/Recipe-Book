import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_state.dart';
import 'package:recipe_book/features/recipe/models/comments_model.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/firebase_repository.dart';
import 'package:recipe_book/shared/models/result.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this.repository) : super(RecipeState());

  final FirebaseRepository repository;

  Future<void> getAllRecipes() async {
    try {
      final currentRecipes = state.recipes.result ?? [];
      if (currentRecipes.isEmpty) {
        emit(state.copyWith(recipes: const Result.loading()));
      }
      final recipes = await repository.getAllRecipes();
      emit(state.copyWith(
        recipes: Result.success(recipes),
        allRecipes: recipes,
      ));
    } catch (e, s) {
      emit(state.copyWith(
          recipes: Result.failure(
        AppConstants.generalErrorMessage,
        s,
      )));
    }
  }

  Future<void> getMyRecipes() async {
    try {
      final currentRecipes = state.userRecipes.result ?? [];
      if (currentRecipes.isEmpty) {
        emit(state.copyWith(userRecipes: const Result.loading()));
      }
      final recipes = await repository.getCurrentUserRecipe();
      emit(state.copyWith(userRecipes: Result.success(recipes)));
    } catch (e, s) {
      emit(state.copyWith(
          userRecipes: Result.failure(
        AppConstants.generalErrorMessage,
        s,
      )));
    }
  }

  Future<void> setSelectedRecipe(RecipeModel recipe) async {
    try {
      emit(state.copyWith(selectedRecipe: recipe));

      final profile = await repository.getProfileWithId(recipe.userId);
      emit(state.copyWith(profile: profile));
    } catch (e) {
      emit(state.copyWith(
        profile: null,
      ));
    }
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
    final recipes = state.allRecipes;
    if (category == 'All') {
      emit(state.copyWith(recipes: Result.success(recipes)));
    } else {
      final filteredRecipes = recipes
          .where((recipe) => recipe.categories.contains(category))
          .toList();
      emit(state.copyWith(recipes: Result.success(filteredRecipes)));
    }
  }

  void search(value) {
    log('searching for $value');
    final recipes = state.allRecipes;
    final filteredRecipes = recipes
        .where((recipe) =>
            recipe.name?.toLowerCase().contains(value.toLowerCase()) ?? false)
        .toList();
    emit(state.copyWith(recipes: Result.success(filteredRecipes)));
  }

  void toggleFavorite(RecipeModel? recipe) {
    if (recipe == null) return;
    final isFavorite = state.isFavorite(recipe);
    if (isFavorite) {
      final updatedFavorites = state.favoriteRecipes
          .where((element) => element.id != recipe.id)
          .toList();
      emit(state.copyWith(favoriteRecipes: updatedFavorites));
    } else {
      final updatedFavorites = [...state.favoriteRecipes, recipe];
      emit(state.copyWith(favoriteRecipes: updatedFavorites));
    }
  }

  void clearFavourite() {
    emit(state.copyWith(favoriteRecipes: []));
  }

  void addComment(String comment, ProfileModel? user) {
    final comments = state.allComments;
    final newComment = CommentsModel(
      id: DateTime.now().toString(),
      user: user,
      recipeId: state.selectedRecipe?.id ?? '',
      comment: comment,
      createdAt: DateTime.now(),
    );
    final updatedComments = [
      ...comments,
      newComment,
    ];
    emit(state.copyWith(
      allComments: updatedComments,
    ));
    getComments();
  }

  void deleteComment(CommentsModel comment) {
    final comments = state.allComments;
    final updatedComments = comments.where((c) => c.id != comment.id).toList();
    emit(state.copyWith(
      allComments: updatedComments,
    ));
    getComments();
  }

  void editComment(CommentsModel comment, String newComment) {
    final comments = state.allComments;
    final updatedComments = comments.map((c) {
      if (c.id == comment.id) {
        return c.copyWith(comment: newComment);
      }
      return c;
    }).toList();
    emit(state.copyWith(
      allComments: updatedComments,
    ));
    getComments();
  }

  void getComments() {
    final recipe = state.selectedRecipe;
    final comments =
        state.allComments.where((c) => c.recipeId == recipe?.id).toList();
    comments.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    emit(state.copyWith(comments: comments));
  }

  void likeRecipe(RecipeModel? recipe) {
    final recipeId = recipe?.id;
    if (recipeId == null) return;
    final likedRecipeIds = state.likedRecipeIds;
    final dislikedRecipeIds = state.dislikedRecipeIds;
    if (likedRecipeIds.contains(recipeId)) {
      final updatedLikedRecipeIds =
          likedRecipeIds.where((id) => id != recipeId).toList();
      emit(state.copyWith(likedRecipeIds: updatedLikedRecipeIds));
    } else {
      final updatedLikedRecipeIds = [...likedRecipeIds, recipeId];
      emit(state.copyWith(likedRecipeIds: updatedLikedRecipeIds));
      if (dislikedRecipeIds.contains(recipeId)) {
        final updatedDislikedRecipeIds =
            dislikedRecipeIds.where((id) => id != recipeId).toList();
        emit(state.copyWith(dislikedRecipeIds: updatedDislikedRecipeIds));
      }
    }
  }

  void dislikeRecipe(RecipeModel? recipe) {
    final recipeId = recipe?.id;
    if (recipeId == null) return;
    final likedRecipeIds = state.likedRecipeIds;
    final dislikedRecipeIds = state.dislikedRecipeIds;
    if (dislikedRecipeIds.contains(recipeId)) {
      final updatedDislikedRecipeIds =
          dislikedRecipeIds.where((id) => id != recipeId).toList();
      emit(state.copyWith(dislikedRecipeIds: updatedDislikedRecipeIds));
    } else {
      final updatedDislikedRecipeIds = [...dislikedRecipeIds, recipeId];
      emit(state.copyWith(dislikedRecipeIds: updatedDislikedRecipeIds));
      if (likedRecipeIds.contains(recipeId)) {
        final updatedLikedRecipeIds =
            likedRecipeIds.where((id) => id != recipeId).toList();
        emit(state.copyWith(likedRecipeIds: updatedLikedRecipeIds));
      }
    }
  }
}
