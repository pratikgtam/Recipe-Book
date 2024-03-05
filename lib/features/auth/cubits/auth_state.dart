import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/shared/models/result.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    @Default(Result<void>.empty()) Result<void> signupStatus,
    @Default(Result<void>.empty()) Result<void> loginStatus,
    @Default(Result<void>.empty()) Result<void> resetPasswordStatus,
  }) = _AuthState;
}
