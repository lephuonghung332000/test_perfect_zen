import 'package:core/core.dart';
import 'package:component/atom/review_us.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/presentation/component/webview/webview_container.dart';

enum MenuItemsType {
  upgradePremiumPlan,
  feedback,
  reviewUs,
  privacyPolicy,
  termOfService,
  restore
}

class MenuItems extends StatelessWidget {
  final String itemName;
  final String? iconPath;
  final Widget? icon;
  final MenuItemsType itemType;
  final VoidCallback? onTap;
  const MenuItems({
    Key? key,
    this.iconPath,
    required this.itemName,
    required this.itemType,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {
          _doOnTap(itemType, context);
        },
        leading: iconPath != null
            ? SizedBox(
                height: 24,
                width: 24,
                child: Center(
                  child: SvgPicture.asset(
                    iconPath!,
                  ),
                ),
              )
            : icon,
        title: Text(
          itemName,
          style: CustomTextStyle.TITLE_16.apply(color: Colors.black),
        ),
        trailing: SizedBox(
          height: 30,
          width: 30,
          child: SvgPicture.asset(AssetsPath.icArrowRightCircle),
        ),
      ),
    ]);
  }

  void _doOnTap(
    MenuItemsType type,
    BuildContext context,
  ) {
    switch (type) {
      case MenuItemsType.upgradePremiumPlan:
        GetIt.I<AnalyticsHelper>()
            .logEvent(CommontAnalyticsEvent(EventName.viewPremium));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SubscriptionPage(),
          ),
        );
        break;
      case MenuItemsType.feedback:
        GetIt.I<AnalyticsHelper>()
            .logEvent(CommontAnalyticsEvent(EventName.viewFeedback));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FeedbackPage(),
          ),
        );
        break;
      case MenuItemsType.reviewUs:
        context.showRateUse();
        break;
      case MenuItemsType.privacyPolicy:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewContainer(
                title: S.current.privacy_policy,
                url: 'https://perfect-zen.web.app/privacy-policy.html',
              ),
            ));

        break;
      case MenuItemsType.termOfService:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewContainer(
                title: S.current.terms_of_service,
                url: 'https://perfect-zen.web.app/terms-of-service.html',
              ),
            ));
        break;
      case MenuItemsType.restore:
        EasyLoading.show(
          maskType: EasyLoadingMaskType.clear,
        );
        BlocProvider.of<SubscriptionBloc>(context).add(RestoreProductEvent());
        break;
    }
  }
}
