import 'package:dependencies/dependencies.dart';
import 'package:settings/settings.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();
}

abstract class ProductsState extends SubscriptionState {
  List<PurchaseProduct> get products;
}

class InitialSubscriptionState extends ProductsState {
  @override
  final List<PurchaseProduct> products;

  InitialSubscriptionState(this.products);

  @override
  List<Object?> get props => [products];
}

class SelectedState extends ProductsState {
  final PurchaseProduct purchaseProduct;
  @override
  final List<PurchaseProduct> products;

  SelectedState({
    required this.purchaseProduct,
    required this.products,
  });

  @override
  List<Object?> get props => [purchaseProduct, products];
}

class SubscriptionSuccessState extends SubscriptionState {
  final String randomStringTo;

  const SubscriptionSuccessState({required this.randomStringTo});
  @override
  List<Object?> get props => [randomStringTo];
}

class RestoreSuccessState extends SubscriptionState {
  final String randomStringTo;

  const RestoreSuccessState({required this.randomStringTo});
  @override
  List<Object?> get props => [randomStringTo];
}
