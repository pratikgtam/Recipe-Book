import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    String? fullName,
    String? email,
    String? profilePic,
    String? id,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
