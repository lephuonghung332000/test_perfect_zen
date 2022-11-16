import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';

abstract class SubscriptionEvent extends Equatable {}

class SelectProductEvent extends SubscriptionEvent {
  final List<PurchaseProduct> products;
  final PurchaseProduct purchaseProduct;

  SelectProductEvent({
    required this.purchaseProduct,
    required this.products,
  });
  @override
  List<Object?> get props => [
        purchaseProduct.productId,
        products,
      ];
}

class BuyProductEvent extends SubscriptionEvent {
  final PurchaseProduct product;

  BuyProductEvent({required this.product});

  @override
  List<Object?> get props => [product.productId];
}

class RestoreProductEvent extends SubscriptionEvent {
  RestoreProductEvent();

  @override
  List<Object?> get props => [];
}
