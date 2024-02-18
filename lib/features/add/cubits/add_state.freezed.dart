// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddState {
  Result<void> get addState => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStateCopyWith<AddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStateCopyWith<$Res> {
  factory $AddStateCopyWith(AddState value, $Res Function(AddState) then) =
      _$AddStateCopyWithImpl<$Res, AddState>;
  @useResult
  $Res call({Result<void> addState, String? imageUrl, List<String> categories});

  $ResultCopyWith<void, $Res> get addState;
}

/// @nodoc
class _$AddStateCopyWithImpl<$Res, $Val extends AddState>
    implements $AddStateCopyWith<$Res> {
  _$AddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addState = null,
    Object? imageUrl = freezed,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      addState: null == addState
          ? _value.addState
          : addState // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<void, $Res> get addState {
    return $ResultCopyWith<void, $Res>(_value.addState, (value) {
      return _then(_value.copyWith(addState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddStateImplCopyWith<$Res>
    implements $AddStateCopyWith<$Res> {
  factory _$$AddStateImplCopyWith(
          _$AddStateImpl value, $Res Function(_$AddStateImpl) then) =
      __$$AddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<void> addState, String? imageUrl, List<String> categories});

  @override
  $ResultCopyWith<void, $Res> get addState;
}

/// @nodoc
class __$$AddStateImplCopyWithImpl<$Res>
    extends _$AddStateCopyWithImpl<$Res, _$AddStateImpl>
    implements _$$AddStateImplCopyWith<$Res> {
  __$$AddStateImplCopyWithImpl(
      _$AddStateImpl _value, $Res Function(_$AddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addState = null,
    Object? imageUrl = freezed,
    Object? categories = null,
  }) {
    return _then(_$AddStateImpl(
      addState: null == addState
          ? _value.addState
          : addState // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddStateImpl implements _AddState {
  _$AddStateImpl(
      {this.addState = const Result<void>.empty(),
      this.imageUrl,
      final List<String> categories = const []})
      : _categories = categories;

  @override
  @JsonKey()
  final Result<void> addState;
  @override
  final String? imageUrl;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'AddState(addState: $addState, imageUrl: $imageUrl, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStateImpl &&
            (identical(other.addState, addState) ||
                other.addState == addState) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addState, imageUrl,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStateImplCopyWith<_$AddStateImpl> get copyWith =>
      __$$AddStateImplCopyWithImpl<_$AddStateImpl>(this, _$identity);
}

abstract class _AddState implements AddState {
  factory _AddState(
      {final Result<void> addState,
      final String? imageUrl,
      final List<String> categories}) = _$AddStateImpl;

  @override
  Result<void> get addState;
  @override
  String? get imageUrl;
  @override
  List<String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$AddStateImplCopyWith<_$AddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
