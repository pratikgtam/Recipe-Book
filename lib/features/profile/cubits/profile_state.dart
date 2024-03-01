import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';
import 'package:recipe_book/shared/models/result.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(Result<ProfileModel>.empty()) Result<ProfileModel> profile,
    @Default(Result<void>.empty()) Result<void> update,
  }) = _ProfileState;
}
