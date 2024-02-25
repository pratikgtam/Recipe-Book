import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_book/features/add/cubits/add_state.dart';
import 'package:recipe_book/shared/firebase_repository.dart';
import 'package:recipe_book/shared/models/result.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this.repository) : super(AddState());

  final FirebaseRepository repository;

  Future<void> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (xFile == null) {
      return;
    }

    final file = File(xFile.path);
    final url = await repository.uploadImage(file: file);
    emit(state.copyWith(imageUrl: url));
  }

  void addCategory(String category) {
    final categories = List<String>.from(state.categories);
    categories.add(category);
    emit(state.copyWith(categories: categories));
  }

  void removeCategory(String category) {
    final categories = List<String>.from(state.categories);
    categories.remove(category);
    emit(state.copyWith(categories: categories));
  }

  Future<void> addRecipe(Map<String, dynamic> formData) async {
    try {
      emit(state.copyWith(addState: const Result<void>.loading()));
      final Map<String, dynamic> value = Map<String, dynamic>.from(formData);
      value['imageUrl'] = state.imageUrl;
      value['categories'] = state.categories;
      await repository.addRecipe(value);
      emit(state.copyWith(addState: const Result<void>.success(null)));
    } catch (e, _) {
      emit(state.copyWith(addState: Result<void>.failure(e.toString(), _)));
    }
  }

  void clear() {
    emit(AddState());
  }
}
