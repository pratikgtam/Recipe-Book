import 'package:flutter_bloc/flutter_bloc.dart';
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
}
