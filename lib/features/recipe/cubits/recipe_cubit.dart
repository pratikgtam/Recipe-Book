import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_state.dart';
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
    emit(state.copyWith(selectedRecipe: recipe));
  }
}
