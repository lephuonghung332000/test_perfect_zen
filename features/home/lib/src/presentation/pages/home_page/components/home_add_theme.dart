import 'package:component/atom/dashes_border.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class HomeAddTheme extends StatelessWidget {
  const HomeAddTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        GetIt.I<AnalyticsHelper>()
            .logEvent(CommontAnalyticsEvent(EventName.addTheme));
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddThemePage()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: DashesBorder(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsPath.icPlus),
                const SizedBox(width: Dimens.dp4),
                Text(
                  S.current.add_my_own_theme,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.WHITE_BUTTON_18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
