import 'failures.dart';

/// Get error data from cache
class CacheFailure extends Failure {
  final String message;
  final int code;

  ///
  CacheFailure({
    required this.message,
    required this.code,
  }) : super(
          code: code,
          message: message,
        );
}
