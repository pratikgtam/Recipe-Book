import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const Result._();
  const factory Result.empty() = _Empty;
  const factory Result.loading({T? oldResult}) = _Loading;
  const factory Result.success(T result) = _Success;
  const factory Result.failure(dynamic error, StackTrace stack) = _Failure;

  T? get result => maybeMap(
        success: (result) => result.result,
        loading: (result) => result.oldResult,
        orElse: () => null,
      );

  dynamic get error => maybeMap(
        failure: (result) => result.error,
        orElse: () => null,
      );

  bool get failed => maybeMap(
        failure: (_) => true,
        orElse: () => false,
      );

  bool get succeeded => maybeMap(
        success: (_) => true,
        orElse: () => false,
      );

  bool get isLoading => maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );
}
