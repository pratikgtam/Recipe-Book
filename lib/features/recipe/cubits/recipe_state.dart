import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/models/result.dart';

part 'recipe_state.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  factory RecipeState({
    @Default(Result<List<RecipeModel>>.empty())
    Result<List<RecipeModel>> userRecipes,
    @Default(Result<List<RecipeModel>>.empty())
    Result<List<RecipeModel>> allRecipes,
  }) = _RecipeState;
}
