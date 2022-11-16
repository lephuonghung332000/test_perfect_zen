import 'failures.dart';

class LocalStorageFailure extends Failure {
  final String? messageException;
  final Exception exception;

  LocalStorageFailure({
    this.messageException,
    required this.exception,
  }) : super(
          message: messageException ?? exception.toString(),
          code: -1,
        );
}
