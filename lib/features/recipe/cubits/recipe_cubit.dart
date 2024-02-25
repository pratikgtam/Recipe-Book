import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_state.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/firebase_repository.dart';
import 'package:recipe_book/shared/models/result.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this.repository) : super(RecipeState());

  final FirebaseRepository repository;

  Future<void> getAllRecipes() async {
    try {
      final currentRecipes = state.allRecipes.result ?? [];
      if (currentRecipes.isEmpty) {
        emit(state.copyWith(allRecipes: const Result.loading()));
      }
      final recipes = await repository.getAllRecipes();
      emit(state.copyWith(allRecipes: Result.success(recipes)));
    } catch (e, s) {
      emit(state.copyWith(
          allRecipes: Result.failure(
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
}
