// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      name: json['name'] as String? ?? 'Momo',
      description: json['description'] as String?,
      image: json['image'] as String? ??
          'https://firebasestorage.googleapis.com/v0/b/mdev-recipe-book.appspot.com/o/licensed-image.jpeg?alt=media&token=fdf44dc9-0842-4bc3-be95-42ad6cbd404b',
      category: json['category'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'ingredients': instance.ingredients,
    };
