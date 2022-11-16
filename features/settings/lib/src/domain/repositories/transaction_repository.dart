import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionDTO?>> getCurrentTransaction(
      NoParams params);
  Future<Either<Failure, TransactionDTO?>> createTransaction(
    String? iosReceipt,
    String? androidProductId,
  );
}
