import 'package:component/atom/gradient_icon.dart';
import 'package:component/molecule/dialog/custom_dialog.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/presentation/component/settings/success_restore_dialog.dart';
import 'menu_items.dart' as items;

class SettingMenu extends StatefulWidget {
  const SettingMenu({Key? key}) : super(key: key);

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  @override
  void initState() {
    BlocProvider.of<TransactionBloc>(Routes.navigatorStateKey.currentContext!)
        .add(GetCurrentTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionBloc, SubscriptionState>(
      listener: (context, state) {
        if (state is RestoreSuccessState) {
          CustomDialog.showConfirmDialog(
            context: context,
            title: S.current.subscription_dialog,
            body: const SuccessRestoreDialog(),
          ).then((_) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SubscriptionPage()),
            );
          });
          return;
        }
      },
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          items.MenuItems(
            itemName: S.current.upgrade_premium_plan,
            itemType: items.MenuItemsType.upgradePremiumPlan,
            iconPath: AssetsPath.icCheckCircle,
          ),
          const SizedBox(height: 5),
          items.MenuItems(
            itemName: S.current.feedback,
            itemType: items.MenuItemsType.feedback,
            iconPath: AssetsPath.icFeedback,
          ),
          const SizedBox(height: 5),
          items.MenuItems(
            itemName: S.current.review_us,
            itemType: items.MenuItemsType.reviewUs,
            iconPath: AssetsPath.icStars,
          ),
          const SizedBox(height: 5),
          items.MenuItems(
            itemName: S.current.privacy_policy,
            itemType: items.MenuItemsType.privacyPolicy,
            icon: const GradientIcon(
              Icons.shield_outlined,
              LinearGradient(
                colors: <Color>[
                  StaticColors.premium_begin_gradient,
                  StaticColors.premium_end_gradient,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const SizedBox(height: 5),
          items.MenuItems(
            itemName: S.current.terms_of_service,
            itemType: items.MenuItemsType.termOfService,
            icon: const GradientIcon(
              Icons.description_outlined,
              LinearGradient(
                colors: <Color>[
                  StaticColors.premium_begin_gradient,
                  StaticColors.premium_end_gradient,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const SizedBox(height: 5),
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionAvailableState) {
                return const SizedBox.shrink();
              }
              return items.MenuItems(
                itemName: S.current.restore_purchase,
                itemType: items.MenuItemsType.restore,
                icon: const GradientIcon(
                  Icons.restore,
                  LinearGradient(
                    colors: <Color>[
                      StaticColors.premium_begin_gradient,
                      StaticColors.premium_end_gradient,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
