import 'package:hive_flutter/hive_flutter.dart';
import 'package:settings/settings.dart';

abstract class TransactionHiveService {
  Future<void> registerAdapterHive();
  Future<void> openBoxHive();
}

class TransactionHiveServiceImpl implements TransactionHiveService {
  static Future<TransactionHiveService> getInstance() async {
    final transactionHiveService = TransactionHiveServiceImpl();
    await transactionHiveService.registerAdapterHive();
    return transactionHiveService;
  }

  @override
  Future<void> registerAdapterHive() async {
    Hive.registerAdapter(TransactionDTOAdapter());
  }

  @override
  Future<void> openBoxHive() async {
    await Hive.openBox<TransactionDTO>('transactionDTO');
  }
}
