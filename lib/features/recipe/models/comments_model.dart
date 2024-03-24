import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
class CommentsModel with _$CommentsModel {
  factory CommentsModel({
    String? id,
    ProfileModel? user,
    String? recipeId,
    String? comment,
    DateTime? createdAt,
  }) = _CommentsModel;

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}
