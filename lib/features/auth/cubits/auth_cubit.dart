import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/auth/cubits/auth_state.dart';
import 'package:recipe_book/features/auth/repositories/auth_repository.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/app_exceptions.dart';
import 'package:recipe_book/shared/models/result.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.repository,
  ) : super(AuthState());

  final AuthRepository repository;

  Future<void> register(Map<String, dynamic>? formValue) async {
    try {
      if (formValue == null) {
        throw Exception(AppConstants.generalErrorMessage);
      }
      emit(
        state.copyWith(
          signupStatus: const Result.loading(),
        ),
      );
      await repository.signup(
        email: formValue['email'] as String,
        password: formValue['password'] as String,
      );
      emit(
        state.copyWith(
          signupStatus: const Result<void>.success(null),
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          signupStatus: Result<String>.failure(
            AppConstants.generalErrorMessage,
            s,
          ),
        ),
      );
    }
  }

  Future<void> login(
    Map<String, dynamic>? value,
  ) async {
    final email = value?['email'] as String?;
    final password = value?['password'] as String?;
    if (email == null || password == null) {
      throw AppException(message: AppConstants.generalErrorMessage);
    }
    try {
      emit(
        state.copyWith(
          loginStatus: const Result.loading(),
        ),
      );
      await repository.emailPasswordLogin(
        email: email,
        password: password,
      );

      emit(
        state.copyWith(
          loginStatus: const Result<void>.success(null),
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          loginStatus: Result<void>.failure(
            e,
            s,
          ),
        ),
      );
    }
  }

  Future<void> googleLogin() async {
    try {
      emit(
        state.copyWith(
          googleLoginStatus: const Result.loading(),
        ),
      );
      await repository.googleLogin();

      emit(
        state.copyWith(
          googleLoginStatus: const Result<void>.success(null),
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          googleLoginStatus: Result<void>.failure(
            e,
            s,
          ),
        ),
      );
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      emit(
        state.copyWith(
          resetPasswordStatus: const Result.loading(),
        ),
      );
      await repository.resetPassword(email: email);

      emit(
        state.copyWith(
          resetPasswordStatus: const Result<void>.success(null),
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          resetPasswordStatus: Result<void>.failure(
            e,
            s,
          ),
        ),
      );
    }
  }
}
