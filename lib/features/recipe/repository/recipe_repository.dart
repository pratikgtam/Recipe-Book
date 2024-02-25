// import 'package:recipe_book/features/recipe/models/recipe_model.dart';
// import 'package:recipe_book/shared/firebase_repository.dart';

// class RecipeRepository {
//   final FirebaseRepository _firebaseService = FirebaseRepository();

//   Future<List<RecipeModel>> getCurrentUserRecipe() async {
//     List<Map<String, dynamic>> productsResponse;

//     productsResponse = await _firebaseService.getCurrentUserRecipe();

    
//     return products;
//   }

//   Future<List<RecipeModel>> getAllRecipes() async {
//     List<Map<String, dynamic>> productsResponse;

//     productsResponse = await _firebaseService.getAllRecipes();

//     final List<RecipeModel> products =
//         productsResponse.map((e) => RecipeModel.fromJson(e)).toList();
//     return products;
//   }
// }
