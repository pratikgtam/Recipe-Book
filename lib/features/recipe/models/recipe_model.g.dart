// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String? ??
          'https://firebasestorage.googleapis.com/v0/b/mdev-recipe-book.appspot.com/o/onboard3.png?alt=media&token=eef49acb-aa0c-45be-8505-2826521d8afe',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ingredients: json['ingredients'] as String?,
      steps: json['steps'] as String?,
      id: json['id'] as String?,
      timeToPrepare: json['timeToPrepare'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'categories': instance.categories,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'id': instance.id,
      'timeToPrepare': instance.timeToPrepare,
      'userId': instance.userId,
    };
