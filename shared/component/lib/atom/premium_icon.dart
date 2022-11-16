import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class PremiumIcon extends StatelessWidget {
  const PremiumIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 78,
      height: 16,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        gradient: LinearGradient(
          colors: [
            StaticColors.premium_begin_gradient,
            StaticColors.premium_end_gradient,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsPath.icStar),
          const SizedBox(
            width: 5,
          ),
          Text(
            S.current.premium,
            style: CustomTextStyle.WHITE_BODY_11,
          ),
        ],
      ),
    );
  }
}
