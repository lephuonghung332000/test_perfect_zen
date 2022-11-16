import 'dart:async';
import 'dart:io';
import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:settings/settings.dart';
import 'package:uuid/uuid.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  final CreateTransactionUseCase createTransactionUseCase;
  final logger = GetIt.I<Logger>();

  SubscriptionBloc({
    required this.createTransactionUseCase,
  }) : super(InitialSubscriptionState(PurchaseProduct.listItems())) {
    on<SelectProductEvent>(
      (event, emit) async {
        emit(
          SelectedState(
            purchaseProduct: event.purchaseProduct,
            products: event.products,
          ),
        );
      },
    );

    on<RestoreProductEvent>(
      (event, emit) async {
        await _inAppPurchase.restorePurchases();
      },
    );

    on<BuyProductEvent>((event, emit) async {
      _subscribe(productId: event.product.productId);
    });

    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;

    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription!.cancel();
    }, onError: (error) {
      logger.e(error);
      _subscription!.cancel();
    });
  }

  Future<void> _initialize() async {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }
  }

  Future _subscribe({required String productId}) async {
    await _initialize();

    try {
      ProductDetailsResponse response =
          await _inAppPurchase.queryProductDetails(<String>{}..add(productId));

      if (response.productDetails.isEmpty) {
        Toast.show(message: S.current.can_not_get_product_on_the_store);
        EasyLoading.dismiss();
        return;
      }

      final productDetail = response.productDetails.first;

      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: productDetail);
      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } catch (err) {
      logger.e(err);
      Toast.show(message: S.current.get_error_when_get_product);
      EasyLoading.dismiss();
    }
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach(
      (
        PurchaseDetails purchaseDetails,
      ) async {
        logger.i(purchaseDetails.purchaseID);

        switch (purchaseDetails.status) {
          case PurchaseStatus.purchased:
            EasyLoading.show(
              maskType: EasyLoadingMaskType.clear,
            );

            String? androidProductId =
                Platform.isAndroid ? purchaseDetails.productID : null;

            final String? iapToken = Platform.isAndroid
                ? null
                : purchaseDetails.verificationData.localVerificationData;

            // Call apple api verify receipt
            final result = await createTransactionUseCase(
              CreateTransactionParams(
                iosReceipt: iapToken,
                androidProductId: androidProductId,
              ),
            );
            result.fold(
              (l) {
                Toast.show(message: 'Purchase failed');
                EasyLoading.dismiss();
              },
              (data) {
                emit(SubscriptionSuccessState(
                    randomStringTo: const Uuid().v4()));
                BlocProvider.of<TransactionBloc>(
                        Routes.navigatorStateKey.currentContext!)
                    .add(GetCurrentTransactionEvent());
                EasyLoading.dismiss();
              },
            );
            break;
          case PurchaseStatus.pending:
            logger.i('Transaction is pending');
            break;
          case PurchaseStatus.restored:
            logger.i('Transaction is restored');

            final String? iapToken = purchaseDetails.productID ==
                    'co.novageeks.mediation.premiummembership'
                ? null
                : purchaseDetails.verificationData.localVerificationData;

            // Call apple api verify receipt
            final result = await createTransactionUseCase(
              CreateTransactionParams(
                  iosReceipt: iapToken, androidProductId: null),
            );
            result.fold(
              (l) {
                Toast.show(message: 'Purchase restore failed');
                EasyLoading.dismiss();
              },
              (data) {
                if (data != null) {
                  emit(RestoreSuccessState(randomStringTo: const Uuid().v4()));
                  BlocProvider.of<TransactionBloc>(
                          Routes.navigatorStateKey.currentContext!)
                      .add(GetCurrentTransactionEvent());
                  EasyLoading.dismiss();
                }
              },
            );

            break;
          case PurchaseStatus.error:
            EasyLoading.dismiss();

            logger.e('Transaction has error: $purchaseDetails.error');
            break;
          case PurchaseStatus.canceled:
            EasyLoading.dismiss();

            break;
          default:
        }

        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      },
    );
  }

  @override
  Future<void> close() async {
    _subscription?.cancel();
    super.close();
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}

extension PurchaseDetailsExt on PurchaseDetails {
  SubscriptionEntity toEntity() {
    if (this is AppStorePurchaseDetails) {
      double? timeStamp;
      try {
        timeStamp = double.parse(transactionDate!);
      } catch (_) {}
      return SubscriptionEntity(
          productId: productID,
          purchaseId: purchaseID,
          transactionToken: verificationData.localVerificationData,
          transactionTimeStamp: timeStamp);
    }
    return const SubscriptionEntity(productId: '', transactionToken: '');
  }

  PurchaseProduct? get product {
    return PurchaseProduct.listItems()
        .firstWhereOrNull((element) => element.productId == productID);
  }
}
