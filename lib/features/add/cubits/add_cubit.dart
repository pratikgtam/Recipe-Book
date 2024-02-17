import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_book/features/add/cubits/add_state.dart';
import 'package:recipe_book/shared/firebase_service.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this.repository) : super(AddState());

  final FirebaseRepository repository;

  Future<void> init() async {}
  Future<File?> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (xFile == null) {
      return null;
    }

    return File(xFile.path);
  }
}
