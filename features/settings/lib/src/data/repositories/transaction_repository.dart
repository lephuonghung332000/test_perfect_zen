import 'dart:io';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final SettingLocalDataSource settingLocalDataSource;
  final TransactionApiDataSource transactionApiDataSource;

  TransactionRepositoryImpl({
    required this.settingLocalDataSource,
    required this.transactionApiDataSource,
  });

  @override
  Future<Either<Failure, TransactionDTO?>> getCurrentTransaction(
      NoParams params) async {
    return await settingLocalDataSource.getCurrentTransaction(params);
  }

  @override
  Future<Either<Failure, TransactionDTO>> createTransaction(
    String? iosReceipt,
    String? androidProductId,
  ) async {
    if (Platform.isAndroid && androidProductId != null) {
      return await settingLocalDataSource
          .addAndroiTransaction(androidProductId);
    }
    if (iosReceipt != null) {
      final result = await transactionApiDataSource.verifyReceipt(iosReceipt);

      return result.fold((error) {
        return Left(error);
      }, (data) async {
        return await settingLocalDataSource.addTransaction(data);
      });
    }
    return await settingLocalDataSource.addForeverTransaction();
  }
}
