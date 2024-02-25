import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/shared/models/result.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(Result<void>.empty()) Result<void> data,
  }) = _ProfileState;
}
