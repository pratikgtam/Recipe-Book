import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    @Default('') String? name,
    String? description,
    @Default(
        'https://firebasestorage.googleapis.com/v0/b/mdev-recipe-book.appspot.com/o/onboard3.png?alt=media&token=eef49acb-aa0c-45be-8505-2826521d8afe')
    String imageUrl,
    @Default([]) List<String> categories,
    String? ingredients,
    String? steps,
    String? id,
    String? timeToPrepare,
    String? userId,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
