import 'package:component/atom/atom.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

import '../../../../settings.dart';

class SuccessRestoreDialog extends StatelessWidget {
  const SuccessRestoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          S.current.you_have_completed_the_installation,
          style: CustomTextStyle.TITLE_14.apply(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          S.current.your_restore_purchase_was_successful,
          style: CustomTextStyle.BODY_14.apply(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: ButtonDialog(
            text: S.current.ok,
            style: ActionButtonStyle.filled,
            onPressed: () {
              GetIt.I<AnalyticsHelper>()
                  .logEvent(CommontAnalyticsEvent(EventName.purchasePremium));
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
