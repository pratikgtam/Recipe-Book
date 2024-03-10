// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  Result<ProfileModel> get profile => throw _privateConstructorUsedError;
  Result<void> get update => throw _privateConstructorUsedError;
  Result<void> get profilePic => throw _privateConstructorUsedError;
  Result<ProfileModel> get profileWithId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {Result<ProfileModel> profile,
      Result<void> update,
      Result<void> profilePic,
      Result<ProfileModel> profileWithId});

  $ResultCopyWith<ProfileModel, $Res> get profile;
  $ResultCopyWith<void, $Res> get update;
  $ResultCopyWith<void, $Res> get profilePic;
  $ResultCopyWith<ProfileModel, $Res> get profileWithId;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? update = null,
    Object? profilePic = null,
    Object? profileWithId = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Result<ProfileModel>,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      profileWithId: null == profileWithId
          ? _value.profileWithId
          : profileWithId // ignore: cast_nullable_to_non_nullable
              as Result<ProfileModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<ProfileModel, $Res> get profile {
    return $ResultCopyWith<ProfileModel, $Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<void, $Res> get update {
    return $ResultCopyWith<void, $Res>(_value.update, (value) {
      return _then(_value.copyWith(update: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<void, $Res> get profilePic {
    return $ResultCopyWith<void, $Res>(_value.profilePic, (value) {
      return _then(_value.copyWith(profilePic: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<ProfileModel, $Res> get profileWithId {
    return $ResultCopyWith<ProfileModel, $Res>(_value.profileWithId, (value) {
      return _then(_value.copyWith(profileWithId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<ProfileModel> profile,
      Result<void> update,
      Result<void> profilePic,
      Result<ProfileModel> profileWithId});

  @override
  $ResultCopyWith<ProfileModel, $Res> get profile;
  @override
  $ResultCopyWith<void, $Res> get update;
  @override
  $ResultCopyWith<void, $Res> get profilePic;
  @override
  $ResultCopyWith<ProfileModel, $Res> get profileWithId;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? update = null,
    Object? profilePic = null,
    Object? profileWithId = null,
  }) {
    return _then(_$ProfileStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Result<ProfileModel>,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      profileWithId: null == profileWithId
          ? _value.profileWithId
          : profileWithId // ignore: cast_nullable_to_non_nullable
              as Result<ProfileModel>,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  _$ProfileStateImpl(
      {this.profile = const Result<ProfileModel>.empty(),
      this.update = const Result<void>.empty(),
      this.profilePic = const Result<void>.empty(),
      this.profileWithId = const Result<ProfileModel>.empty()});

  @override
  @JsonKey()
  final Result<ProfileModel> profile;
  @override
  @JsonKey()
  final Result<void> update;
  @override
  @JsonKey()
  final Result<void> profilePic;
  @override
  @JsonKey()
  final Result<ProfileModel> profileWithId;

  @override
  String toString() {
    return 'ProfileState(profile: $profile, update: $update, profilePic: $profilePic, profileWithId: $profileWithId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.profileWithId, profileWithId) ||
                other.profileWithId == profileWithId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profile, update, profilePic, profileWithId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  factory _ProfileState(
      {final Result<ProfileModel> profile,
      final Result<void> update,
      final Result<void> profilePic,
      final Result<ProfileModel> profileWithId}) = _$ProfileStateImpl;

  @override
  Result<ProfileModel> get profile;
  @override
  Result<void> get update;
  @override
  Result<void> get profilePic;
  @override
  Result<ProfileModel> get profileWithId;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
