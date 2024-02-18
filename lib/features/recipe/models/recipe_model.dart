import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    @Default('Momo') String? name,
    String? description,
    @Default(
        'https://firebasestorage.googleapis.com/v0/b/mdev-recipe-book.appspot.com/o/licensed-image.jpeg?alt=media&token=fdf44dc9-0842-4bc3-be95-42ad6cbd404b')
    String image,
    String? category,
    @Default([]) List<String> ingredients,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
