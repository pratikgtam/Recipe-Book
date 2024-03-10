// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      profilePic: json['profilePic'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'profilePic': instance.profilePic,
      'id': instance.id,
    };
