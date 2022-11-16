import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';

extension RateUsEx on BuildContext {
  void showRateUse() {
    RateMyApp rateMyApp = RateMyApp(
      preferencesPrefix: 'rateMyApp_',
      minDays: 0,
      minLaunches: 2,
      remindDays: 4,
      remindLaunches: 4,
      googlePlayIdentifier: 'co.novageeks.mediation',
      appStoreIdentifier: 'co.novageeks.mediation',
    );

    rateMyApp.init().then((_) {
      rateMyApp.showStarRateDialog(
        this,
        title: S.of(this).rate_my_app,
        message: S.of(this).leave_rating,
        actionsBuilder: (context, stars) {
          return [
            TextButton(
              child: Text(S.current.survey_submit),
              onPressed: () {
                if (stars != null) {
                  rateMyApp.save().then((v) => Navigator.pop(context));
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ];
        },
        dialogStyle: const DialogStyle(
          titleAlign: TextAlign.center,
          messageAlign: TextAlign.center,
          messagePadding: EdgeInsets.only(bottom: 20.0),
        ),
        starRatingOptions: const StarRatingOptions(),
      );
    });
  }
}
