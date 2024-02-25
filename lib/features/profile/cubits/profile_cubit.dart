import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/profile/cubits/profile_state.dart';
import 'package:recipe_book/shared/firebase_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repository) : super(ProfileState());

  final FirebaseRepository repository;

  Future<void> init() async {}
}
