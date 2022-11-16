import 'package:core/core.dart';

abstract class SubscriptionLocalDataSource {}

class SubscriptionLocalDataSourceImpl extends SubscriptionLocalDataSource {
  final LocalStorageManager localStorageManager;

  SubscriptionLocalDataSourceImpl({required this.localStorageManager});
}
