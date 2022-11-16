import 'package:dependencies/dependencies.dart';

import '../../data/data.dart';

class SubscriptionEntity extends Equatable {
  final String productId;
  final String? purchaseId;
  final double? transactionTimeStamp;
  final String transactionToken;
  const SubscriptionEntity(
      {required this.transactionToken,
      required this.productId,
      this.purchaseId,
      this.transactionTimeStamp});

  @override
  List<Object?> get props =>
      [productId, purchaseId, transactionTimeStamp, transactionToken];

  SubscriptionModel toModel() {
    return SubscriptionModel(
        productId: productId,
        purchaseId: purchaseId,
        transactionToken: transactionToken,
        transactionTimeStamp: transactionTimeStamp);
  }
}
