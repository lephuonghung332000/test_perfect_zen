import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:settings/src/data/data.dart';

class Boxes {
  void box() {}
  static Box<TransactionDTO> getListTransactionDTO() =>
      Hive.box<TransactionDTO>('transactionDTO');
}
