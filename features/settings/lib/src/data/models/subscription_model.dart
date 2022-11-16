import 'package:settings/src/domain/entities/subscription_entity.dart';

class SubscriptionModel {
  final String productId;
  final String? purchaseId;
  final double? transactionTimeStamp;
  final String transactionToken;

  const SubscriptionModel({
    required this.productId,
    this.purchaseId,
    this.transactionTimeStamp,
    required this.transactionToken,
  });

  factory SubscriptionModel.fromsubscription(SubscriptionEntity subscription) {
    return SubscriptionModel(
        productId: subscription.productId,
        purchaseId: subscription.purchaseId,
        transactionTimeStamp: subscription.transactionTimeStamp,
        transactionToken: subscription.transactionToken);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'productId': productId,
        'transactionToken': transactionToken,
        'purchaseId': purchaseId,
        'transactionTimeStamp': transactionTimeStamp
      };

  factory SubscriptionModel.fromJson(Map<String, dynamic> data) {
    return SubscriptionModel(
        productId: data['productId'],
        purchaseId: data['purchaseId'],
        transactionTimeStamp: data['transactionTimeStamp'],
        transactionToken: data['transactionToken']);
  }

  SubscriptionEntity toEntity() {
    return SubscriptionEntity(
        productId: productId,
        purchaseId: purchaseId,
        transactionToken: transactionToken,
        transactionTimeStamp: transactionTimeStamp);
  }
}
