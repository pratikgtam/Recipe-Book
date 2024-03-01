import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_book/features/profile/cubits/profile_state.dart';
import 'package:recipe_book/shared/firebase_repository.dart';
import 'package:recipe_book/shared/models/result.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repository) : super(ProfileState());

  final FirebaseRepository repository;

  Future<void> getProfile() async {
    try {
      emit(state.copyWith(profile: const Result.loading()));
      final profile = await repository.getProfile();
      emit(state.copyWith(profile: Result.success(profile)));
    } catch (e, _) {
      emit(state.copyWith(
        profile: Result.failure(e, _),
      ));
    }
  }

  Future<void> updateProfile(Map<String, dynamic>? value) async {
    try {
      emit(state.copyWith(update: const Result.loading()));
      await repository.updateProfile(value);
      await getProfile();
      emit(state.copyWith(update: const Result.success(null)));
    } catch (e, _) {
      emit(state.copyWith(
        update: Result.failure(e, _),
      ));
    }
  }

  Future<void> updateProfilePic() async {
    try {
      final xFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (xFile == null) {
        return;
      }

      final file = File(xFile.path);
      final url = await repository.uploadImage(file: file);
      repository.updateProfile({'profilePic': url});
      await getProfile();
      emit(state.copyWith(profilePic: const Result.success(null)));
    } catch (e, _) {
      emit(state.copyWith(
        profilePic: Result.failure(e.toString(), _),
      ));
    }
  }
}
