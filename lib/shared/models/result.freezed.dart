// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(T? oldResult) loading,
    required TResult Function(T result) success,
    required TResult Function(dynamic error, StackTrace stack) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(T? oldResult)? loading,
    TResult? Function(T result)? success,
    TResult? Function(dynamic error, StackTrace stack)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(T? oldResult)? loading,
    TResult Function(T result)? success,
    TResult Function(dynamic error, StackTrace stack)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res, Result<T>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res, $Val extends Result<T>>
    implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T> value, $Res Function(_$EmptyImpl<T>) then) =
      __$$EmptyImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$EmptyImpl<T>>
    implements _$$EmptyImplCopyWith<T, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T> _value, $Res Function(_$EmptyImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyImpl<T> extends _Empty<T> {
  const _$EmptyImpl() : super._();

  @override
  String toString() {
    return 'Result<$T>.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(T? oldResult) loading,
    required TResult Function(T result) success,
    required TResult Function(dynamic error, StackTrace stack) failure,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(T? oldResult)? loading,
    TResult? Function(T result)? success,
    TResult? Function(dynamic error, StackTrace stack)? failure,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(T? oldResult)? loading,
    TResult Function(T result)? success,
    TResult Function(dynamic error, StackTrace stack)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failure<T> value) failure,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Failure<T> value)? failure,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> extends Result<T> {
  const factory _Empty() = _$EmptyImpl<T>;
  const _Empty._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? oldResult});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldResult = freezed,
  }) {
    return _then(_$LoadingImpl<T>(
      oldResult: freezed == oldResult
          ? _value.oldResult
          : oldResult // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl<T> extends _Loading<T> {
  const _$LoadingImpl({this.oldResult}) : super._();

  @override
  final T? oldResult;

  @override
  String toString() {
    return 'Result<$T>.loading(oldResult: $oldResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl<T> &&
            const DeepCollectionEquality().equals(other.oldResult, oldResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(oldResult));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      __$$LoadingImplCopyWithImpl<T, _$LoadingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(T? oldResult) loading,
    required TResult Function(T result) success,
    required TResult Function(dynamic error, StackTrace stack) failure,
  }) {
    return loading(oldResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(T? oldResult)? loading,
    TResult? Function(T result)? success,
    TResult? Function(dynamic error, StackTrace stack)? failure,
  }) {
    return loading?.call(oldResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(T? oldResult)? loading,
    TResult Function(T result)? success,
    TResult Function(dynamic error, StackTrace stack)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(oldResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Failure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> extends Result<T> {
  const factory _Loading({final T? oldResult}) = _$LoadingImpl<T>;
  const _Loading._() : super._();

  T? get oldResult;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T result});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> extends _Success<T> {
  const _$SuccessImpl(this.result) : super._();

  @override
  final T result;

  @override
  String toString() {
    return 'Result<$T>.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(T? oldResult) loading,
    required TResult Function(T result) success,
    required TResult Function(dynamic error, StackTrace stack) failure,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(T? oldResult)? loading,
    TResult? Function(T result)? success,
    TResult? Function(dynamic error, StackTrace stack)? failure,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(T? oldResult)? loading,
    TResult Function(T result)? success,
    TResult Function(dynamic error, StackTrace stack)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Failure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> extends Result<T> {
  const factory _Success(final T result) = _$SuccessImpl<T>;
  const _Success._() : super._();

  T get result;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic error, StackTrace stack});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? stack = null,
  }) {
    return _then(_$FailureImpl<T>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> extends _Failure<T> {
  const _$FailureImpl(this.error, this.stack) : super._();

  @override
  final dynamic error;
  @override
  final StackTrace stack;

  @override
  String toString() {
    return 'Result<$T>.failure(error: $error, stack: $stack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stack, stack) || other.stack == stack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(T? oldResult) loading,
    required TResult Function(T result) success,
    required TResult Function(dynamic error, StackTrace stack) failure,
  }) {
    return failure(error, stack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(T? oldResult)? loading,
    TResult? Function(T result)? success,
    TResult? Function(dynamic error, StackTrace stack)? failure,
  }) {
    return failure?.call(error, stack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(T? oldResult)? loading,
    TResult Function(T result)? success,
    TResult Function(dynamic error, StackTrace stack)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, stack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<T> extends Result<T> {
  const factory _Failure(final dynamic error, final StackTrace stack) =
      _$FailureImpl<T>;
  const _Failure._() : super._();

  dynamic get error;
  StackTrace get stack;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
