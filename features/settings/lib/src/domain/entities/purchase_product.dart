import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class PurchaseProduct extends Equatable {
  final String productId;
  final String premiumBadge;
  final String nameProduct;
  final String price;
  final ProductDetails? productDetails;

  const PurchaseProduct(
      {required this.premiumBadge,
      required this.nameProduct,
      required this.price,
      required this.productId,
      this.productDetails});
  @override
  List<Object?> get props => [premiumBadge, nameProduct, price];

  static List<PurchaseProduct> listItems() {
    final globalConfig = GetIt.I<GlobalConfiguration>();
    final productAnnualyId = globalConfig.getValue<String?>('product_annally');
    final productMonthlyID = globalConfig.getValue<String?>('product_monthly');
    final productThreeMonths =
        globalConfig.getValue<String?>('product_three_months');

    return [
      PurchaseProduct(
        productId: productAnnualyId ?? '',
        nameProduct: 'ANNUALLY',
        premiumBadge: 'Best Value',
        price: '\$39.99/year',
      ),
      PurchaseProduct(
        productId: productThreeMonths ?? '',
        nameProduct: '3 MONTHS',
        price: '\$12.99',
        premiumBadge: '',
      ),
      PurchaseProduct(
        productId: productMonthlyID ?? '',
        nameProduct: 'MONTHLY',
        premiumBadge: 'Most Popular',
        price: '\$4.99/month',
      ),
    ];
  }
}
