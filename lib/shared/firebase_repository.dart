import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/app_constants.dart';

class FirebaseRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<RecipeModel>> getCurrentUserRecipe() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
        .collection(
          AppConstants.usersCollectionName,
        )
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection(AppConstants.recipeCollectionName)
        .get();

    final List<Map<String, dynamic>> response = querySnapshot.docs
        .map((e) => {
              ...e.data(),
              'id': e.id,
            })
        .toList();

    final List<RecipeModel> products =
        response.map((e) => RecipeModel.fromJson(e)).toList();

    return products;
  }

  Future<List<RecipeModel>> getAllRecipes() async {
    //use collection group to get all recipes from all users
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collectionGroup(AppConstants.recipeCollectionName).get();

    final List<Map<String, dynamic>> response = querySnapshot.docs
        .map((e) => {
              ...e.data(),
              'id': e.id,
            })
        .toList();

    final List<RecipeModel> products =
        response.map((e) => RecipeModel.fromJson(e)).toList();

    return products;
  }

  Future<void> deleteDocument(
          {required String collectionName, required String id}) async =>
      await db.collection(collectionName).doc(id).delete();

  Future<void> addDocument(
      {required String collectionName,
      String? path,
      required Map<String, dynamic> data}) async {
    db.collection(collectionName).doc(path).set(data);
  }

  //update document
  Future<void> updateDocument(
      {required String collectionName,
      required Map<String, dynamic> data,
      required String id}) async {
    await db.collection(collectionName).doc(id).update(data);
  }

  //delete collection
  Future<void> deleteCollection({required String collectionName}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection(collectionName).get();
    final batch = FirebaseFirestore.instance.batch();

    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }
    return batch.commit();
  }

  Future<String> uploadImage({required File file}) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('$imageName.jpg');
    UploadTask uploadTask = ref.putFile(file);
    final url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }

  Future<void> addRecipe(Map<String, dynamic> data) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      await db
          .collection(AppConstants.usersCollectionName)
          .doc(userId)
          .collection(AppConstants.recipeCollectionName)
          .add(data);
    } catch (e, _) {
      rethrow;
    }
  }
}
