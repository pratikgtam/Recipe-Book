import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/shared/models/result.dart';

part 'add_state.freezed.dart';

@freezed
class AddState with _$AddState {
  factory AddState({
    @Default(Result<void>.empty()) Result<void> data,
    String? imageUrl,
    @Default([]) List<String> categories,
  }) = _AddState;
}
