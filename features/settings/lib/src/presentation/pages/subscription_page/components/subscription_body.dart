import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/presentation/component/subscription/subscription_plan_bar.dart';
import 'package:settings/src/presentation/component/subscription/subscription_subscribed_bar.dart';
import 'package:settings/src/presentation/pages/subscription_page/components/subscription_list_product.dart';
import '../../../../analytics/analytics.dart';
import '../../../component/subscription/subscription_bullet_list_bar.dart';
import 'success_subscription_dialog.dart';

class SubscriptionBody extends StatefulWidget {
  const SubscriptionBody({Key? key}) : super(key: key);

  @override
  State<SubscriptionBody> createState() => _SubscriptionBodyState();
}

class _SubscriptionBodyState extends State<SubscriptionBody> {
  @override
  void initState() {
    BlocProvider.of<TransactionBloc>(context).add(GetCurrentTransactionEvent());
    BlocProvider.of<SubscriptionBloc>(context).add(
      SelectProductEvent(
        products: PurchaseProduct.listItems(),
        purchaseProduct: PurchaseProduct.listItems().first,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionBloc, SubscriptionState>(
      listener: (context, state) {
        if (state is SubscriptionSuccessState) {
          CustomDialog.showConfirmDialog(
            context: context,
            title: S.current.subscription_dialog,
            body: const SuccessSubscriptionDialog(),
          );
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, transactionState) {
                      if (transactionState is TransactionAvailableState) {
                        return SubscriptionSubscribedBar(
                          purchaseDate: transactionState.purchaseDate,
                        );
                      }
                      return Container();
                    },
                  ),
                  const SubscriptionBulletListBar(),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: _buildPlans(),
                  ),
                ],
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlans() {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, transactionState) {
        if (transactionState is TransactionAvailableState) {
          return _buildPurchasedTransaction(transactionState.productId);
        }
        return _buildSelectProduct();
      },
    );
  }

  Widget _buildSelectProduct() {
    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      builder: (context, state) {
        if (state is ProductsState) {
          return SubscriptionListProduct(
            title: S.current.select_a_plan,
            child: _buildListSubscription(state.products),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildPurchasedTransaction(String productId) {
    return SubscriptionListProduct(
      title: S.current.your_subscribed_plan,
      child: Align(
        alignment: Alignment.topLeft,
        child: SubscriptionPlanBar(
          purchaseProduct: PurchaseProduct.listItems()
              .firstWhereOrNull((element) => element.productId == productId)!,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, transactionState) {
        if (transactionState is TransactionAvailableState) {
          return const SizedBox.shrink();
        }
        return BlocBuilder<SubscriptionBloc, SubscriptionState>(
          builder: (context, state) {
            if (state is! SelectedState) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomButton(
                onClick: () async {
                  EasyLoading.show(
                    maskType: EasyLoadingMaskType.clear,
                  );

                  GetIt.I<AnalyticsHelper>()
                      .logEvent(CommontAnalyticsEvent(EventName.beginPayment));
                  context
                      .read<SubscriptionBloc>()
                      .add(BuyProductEvent(product: state.purchaseProduct));
                },
                name: 'Continue to Pay ${state.purchaseProduct.price}',
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildListSubscription(List<PurchaseProduct> products) {
    int length = products.length + 1;
    return ListView.separated(
      itemCount: length,
      itemBuilder: (context, index) {
        return BlocBuilder<SubscriptionBloc, SubscriptionState>(
          buildWhen: (previous, current) => current is SelectedState,
          builder: (context, state) {
            bool selected = false;

            if (index == length - 1) {
              return const SizedBox.shrink();
            }

            if (state is SelectedState) {
              selected =
                  state.purchaseProduct.productId == products[index].productId;
            }

            return SubscriptionPlanBar(
              purchaseProduct: products[index],
              onClick: () {
                GetIt.I<AnalyticsHelper>().logEvent(
                    SelectPremiumPlanEvent(products[index].nameProduct));

                context.read<SubscriptionBloc>().add(
                      SelectProductEvent(
                        products: products,
                        purchaseProduct: products[index],
                      ),
                    );
              },
              selected: selected,
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
    );
  }
}
