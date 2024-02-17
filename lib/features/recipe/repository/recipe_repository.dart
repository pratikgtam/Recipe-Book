import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/firebase_service.dart';

class RecipeRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<RecipeModel>> getRecipe() async {
    List<Map<String, dynamic>> productsResponse;

    productsResponse = await _firebaseService.getCollection(
        name: AppConstants.recipeCollectionName);

    final List<RecipeModel> products =
        productsResponse.map((e) => RecipeModel.fromJson(e)).toList();
    return products;
  }
}
