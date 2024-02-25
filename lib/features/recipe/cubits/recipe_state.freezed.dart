// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeState {
  Result<List<RecipeModel>> get userRecipes =>
      throw _privateConstructorUsedError;
  Result<List<RecipeModel>> get allRecipes =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeStateCopyWith<RecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res, RecipeState>;
  @useResult
  $Res call(
      {Result<List<RecipeModel>> userRecipes,
      Result<List<RecipeModel>> allRecipes});

  $ResultCopyWith<List<RecipeModel>, $Res> get userRecipes;
  $ResultCopyWith<List<RecipeModel>, $Res> get allRecipes;
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res, $Val extends RecipeState>
    implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRecipes = null,
    Object? allRecipes = null,
  }) {
    return _then(_value.copyWith(
      userRecipes: null == userRecipes
          ? _value.userRecipes
          : userRecipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
      allRecipes: null == allRecipes
          ? _value.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<RecipeModel>, $Res> get userRecipes {
    return $ResultCopyWith<List<RecipeModel>, $Res>(_value.userRecipes,
        (value) {
      return _then(_value.copyWith(userRecipes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<RecipeModel>, $Res> get allRecipes {
    return $ResultCopyWith<List<RecipeModel>, $Res>(_value.allRecipes, (value) {
      return _then(_value.copyWith(allRecipes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeStateImplCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$RecipeStateImplCopyWith(
          _$RecipeStateImpl value, $Res Function(_$RecipeStateImpl) then) =
      __$$RecipeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<List<RecipeModel>> userRecipes,
      Result<List<RecipeModel>> allRecipes});

  @override
  $ResultCopyWith<List<RecipeModel>, $Res> get userRecipes;
  @override
  $ResultCopyWith<List<RecipeModel>, $Res> get allRecipes;
}

/// @nodoc
class __$$RecipeStateImplCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$RecipeStateImpl>
    implements _$$RecipeStateImplCopyWith<$Res> {
  __$$RecipeStateImplCopyWithImpl(
      _$RecipeStateImpl _value, $Res Function(_$RecipeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRecipes = null,
    Object? allRecipes = null,
  }) {
    return _then(_$RecipeStateImpl(
      userRecipes: null == userRecipes
          ? _value.userRecipes
          : userRecipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
      allRecipes: null == allRecipes
          ? _value.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
    ));
  }
}

/// @nodoc

class _$RecipeStateImpl implements _RecipeState {
  _$RecipeStateImpl(
      {this.userRecipes = const Result<List<RecipeModel>>.empty(),
      this.allRecipes = const Result<List<RecipeModel>>.empty()});

  @override
  @JsonKey()
  final Result<List<RecipeModel>> userRecipes;
  @override
  @JsonKey()
  final Result<List<RecipeModel>> allRecipes;

  @override
  String toString() {
    return 'RecipeState(userRecipes: $userRecipes, allRecipes: $allRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStateImpl &&
            (identical(other.userRecipes, userRecipes) ||
                other.userRecipes == userRecipes) &&
            (identical(other.allRecipes, allRecipes) ||
                other.allRecipes == allRecipes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userRecipes, allRecipes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStateImplCopyWith<_$RecipeStateImpl> get copyWith =>
      __$$RecipeStateImplCopyWithImpl<_$RecipeStateImpl>(this, _$identity);
}

abstract class _RecipeState implements RecipeState {
  factory _RecipeState(
      {final Result<List<RecipeModel>> userRecipes,
      final Result<List<RecipeModel>> allRecipes}) = _$RecipeStateImpl;

  @override
  Result<List<RecipeModel>> get userRecipes;
  @override
  Result<List<RecipeModel>> get allRecipes;
  @override
  @JsonKey(ignore: true)
  _$$RecipeStateImplCopyWith<_$RecipeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
