import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCollection(
      {required String name}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection(name).get();

    final List<Map<String, dynamic>> response = querySnapshot.docs
        .map((e) => {
              ...e.data(),
              'id': e.id,
            })
        .toList();
    return response;
  }

  Future<void> deleteDocument(
          {required String collectionName, required String id}) async =>
      await db.collection(collectionName).doc(id).delete();

  Future<void> addDocument(
      {required String collectionName,
      required Map<String, dynamic> data}) async {
    await db.collection(collectionName).add(data);
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
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('image1.jpg');
    UploadTask uploadTask = ref.putFile(file);
    final url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }
}
