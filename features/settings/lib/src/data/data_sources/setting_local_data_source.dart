import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';
import 'package:jiffy/jiffy.dart';

abstract class SettingLocalDataSource {
  Future<Either<Failure, TransactionDTO?>> getCurrentTransaction(
      NoParams params);

  Future<Either<Failure, TransactionDTO>> addTransaction(
      Map<String, dynamic> data);

  Future<Either<Failure, TransactionDTO>> addForeverTransaction();
  Future<Either<Failure, TransactionDTO>> addAndroiTransaction(
      String androidProductId);
}

class SettingLocalDataSourceImpl extends SettingLocalDataSource {
  final TransactionHiveService transactionHiveService;

  SettingLocalDataSourceImpl({
    required this.transactionHiveService,
  });

  @override
  Future<Either<Failure, TransactionDTO?>> getCurrentTransaction(
      NoParams params) async {
    try {
      await transactionHiveService.openBoxHive();

      final boxTransactionDTO = Hive.box<TransactionDTO>('transactionDTO');

      return Right(boxTransactionDTO.values.isEmpty
          ? null
          : boxTransactionDTO.values.last);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TransactionDTO>> addTransaction(
      Map<String, dynamic> data) async {
    try {
      final boxTransactionDTO = Hive.box<TransactionDTO>('transactionDTO');

      final TransactionDTO transaction = TransactionDTO(
        token: data['latest_receipt'],
        productId: data['latest_receipt_info'].last['product_id'],
        transactionId: data['latest_receipt_info'].last['transaction_id'],
        originalTransactionId:
            data['latest_receipt_info'].last['original_transaction_id'],
        purchaseDate: DateFormatter.yearMonthDay(
          data['latest_receipt_info'].last['purchase_date'],
          utc: true,
        ),
        expiredDate: DateFormatter.yearMonthDay(
          data['latest_receipt_info'].last['expires_date'],
          utc: true,
        ),
      );

      boxTransactionDTO.add(transaction);
      return Right(transaction);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TransactionDTO>> addAndroiTransaction(
      String androidProductId) async {
    try {
      DateTime expiredDate = DateTime.now();
      if (androidProductId.contains('perfectzen.month')) {
        expiredDate = Jiffy().add(months: 1).dateTime;
      }
      if (androidProductId.contains('perfectzen.three.months')) {
        expiredDate = Jiffy().add(months: 3).dateTime;
      }
      if (androidProductId.contains('perfectzen.annually')) {
        expiredDate = Jiffy().add(years: 1).dateTime;
      }

      final boxTransactionDTO = Hive.box<TransactionDTO>('transactionDTO');

      final TransactionDTO transaction = TransactionDTO(
        token: '',
        productId: androidProductId,
        transactionId: '',
        originalTransactionId: '',
        purchaseDate: DateTime.now(),
        expiredDate: expiredDate,
      );

      boxTransactionDTO.add(transaction);
      return Right(transaction);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TransactionDTO>> addForeverTransaction() async {
    try {
      final globalConfig = GetIt.I<GlobalConfiguration>();
      final productAnnualyId =
          globalConfig.getValue<String?>('product_annally');

      final boxTransactionDTO = Hive.box<TransactionDTO>('transactionDTO');

      final TransactionDTO transaction = TransactionDTO(
        token: '',
        productId: productAnnualyId ?? '',
        transactionId: '',
        originalTransactionId: '',
        purchaseDate: DateTime.now(),
        expiredDate:
            DateTime.now().add(const Duration(days: 360000)), // 100 years
      );

      boxTransactionDTO.add(transaction);
      return Right(transaction);
    } on Exception catch (error) {
      return Left(
        LocalStorageFailure(
          exception: error,
        ),
      );
    }
  }
}
