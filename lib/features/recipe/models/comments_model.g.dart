// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsModelImpl _$$CommentsModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentsModelImpl(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : ProfileModel.fromJson(json['user'] as Map<String, dynamic>),
      recipeId: json['recipeId'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentsModelImplToJson(_$CommentsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'recipeId': instance.recipeId,
      'comment': instance.comment,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
