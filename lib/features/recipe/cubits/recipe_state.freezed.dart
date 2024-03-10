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
  Result<List<RecipeModel>> get recipes => throw _privateConstructorUsedError;
  List<RecipeModel> get allRecipes => throw _privateConstructorUsedError;
  RecipeModel? get selectedRecipe => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  ProfileModel? get profile => throw _privateConstructorUsedError;

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
      Result<List<RecipeModel>> recipes,
      List<RecipeModel> allRecipes,
      RecipeModel? selectedRecipe,
      String selectedCategory,
      ProfileModel? profile});

  $ResultCopyWith<List<RecipeModel>, $Res> get userRecipes;
  $ResultCopyWith<List<RecipeModel>, $Res> get recipes;
  $RecipeModelCopyWith<$Res>? get selectedRecipe;
  $ProfileModelCopyWith<$Res>? get profile;
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
    Object? recipes = null,
    Object? allRecipes = null,
    Object? selectedRecipe = freezed,
    Object? selectedCategory = null,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      userRecipes: null == userRecipes
          ? _value.userRecipes
          : userRecipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
      allRecipes: null == allRecipes
          ? _value.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
      selectedRecipe: freezed == selectedRecipe
          ? _value.selectedRecipe
          : selectedRecipe // ignore: cast_nullable_to_non_nullable
              as RecipeModel?,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
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
  $ResultCopyWith<List<RecipeModel>, $Res> get recipes {
    return $ResultCopyWith<List<RecipeModel>, $Res>(_value.recipes, (value) {
      return _then(_value.copyWith(recipes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeModelCopyWith<$Res>? get selectedRecipe {
    if (_value.selectedRecipe == null) {
      return null;
    }

    return $RecipeModelCopyWith<$Res>(_value.selectedRecipe!, (value) {
      return _then(_value.copyWith(selectedRecipe: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
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
      Result<List<RecipeModel>> recipes,
      List<RecipeModel> allRecipes,
      RecipeModel? selectedRecipe,
      String selectedCategory,
      ProfileModel? profile});

  @override
  $ResultCopyWith<List<RecipeModel>, $Res> get userRecipes;
  @override
  $ResultCopyWith<List<RecipeModel>, $Res> get recipes;
  @override
  $RecipeModelCopyWith<$Res>? get selectedRecipe;
  @override
  $ProfileModelCopyWith<$Res>? get profile;
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
    Object? recipes = null,
    Object? allRecipes = null,
    Object? selectedRecipe = freezed,
    Object? selectedCategory = null,
    Object? profile = freezed,
  }) {
    return _then(_$RecipeStateImpl(
      userRecipes: null == userRecipes
          ? _value.userRecipes
          : userRecipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as Result<List<RecipeModel>>,
      allRecipes: null == allRecipes
          ? _value._allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
      selectedRecipe: freezed == selectedRecipe
          ? _value.selectedRecipe
          : selectedRecipe // ignore: cast_nullable_to_non_nullable
              as RecipeModel?,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
    ));
  }
}

/// @nodoc

class _$RecipeStateImpl implements _RecipeState {
  _$RecipeStateImpl(
      {this.userRecipes = const Result<List<RecipeModel>>.empty(),
      this.recipes = const Result<List<RecipeModel>>.empty(),
      final List<RecipeModel> allRecipes = const [],
      this.selectedRecipe,
      this.selectedCategory = 'All',
      this.profile})
      : _allRecipes = allRecipes;

  @override
  @JsonKey()
  final Result<List<RecipeModel>> userRecipes;
  @override
  @JsonKey()
  final Result<List<RecipeModel>> recipes;
  final List<RecipeModel> _allRecipes;
  @override
  @JsonKey()
  List<RecipeModel> get allRecipes {
    if (_allRecipes is EqualUnmodifiableListView) return _allRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allRecipes);
  }

  @override
  final RecipeModel? selectedRecipe;
  @override
  @JsonKey()
  final String selectedCategory;
  @override
  final ProfileModel? profile;

  @override
  String toString() {
    return 'RecipeState(userRecipes: $userRecipes, recipes: $recipes, allRecipes: $allRecipes, selectedRecipe: $selectedRecipe, selectedCategory: $selectedCategory, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStateImpl &&
            (identical(other.userRecipes, userRecipes) ||
                other.userRecipes == userRecipes) &&
            (identical(other.recipes, recipes) || other.recipes == recipes) &&
            const DeepCollectionEquality()
                .equals(other._allRecipes, _allRecipes) &&
            (identical(other.selectedRecipe, selectedRecipe) ||
                other.selectedRecipe == selectedRecipe) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userRecipes,
      recipes,
      const DeepCollectionEquality().hash(_allRecipes),
      selectedRecipe,
      selectedCategory,
      profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStateImplCopyWith<_$RecipeStateImpl> get copyWith =>
      __$$RecipeStateImplCopyWithImpl<_$RecipeStateImpl>(this, _$identity);
}

abstract class _RecipeState implements RecipeState {
  factory _RecipeState(
      {final Result<List<RecipeModel>> userRecipes,
      final Result<List<RecipeModel>> recipes,
      final List<RecipeModel> allRecipes,
      final RecipeModel? selectedRecipe,
      final String selectedCategory,
      final ProfileModel? profile}) = _$RecipeStateImpl;

  @override
  Result<List<RecipeModel>> get userRecipes;
  @override
  Result<List<RecipeModel>> get recipes;
  @override
  List<RecipeModel> get allRecipes;
  @override
  RecipeModel? get selectedRecipe;
  @override
  String get selectedCategory;
  @override
  ProfileModel? get profile;
  @override
  @JsonKey(ignore: true)
  _$$RecipeStateImplCopyWith<_$RecipeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
