import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class AddThemePageHeader extends StatelessWidget {
  const AddThemePageHeader({
    Key? key,
    required this.onBack,
    this.content,
  }) : super(key: key);

  final Function onBack;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            onBack.call();
          },
          child: SizedBox(
            width: 25,
            child: SvgPicture.asset(AssetsPath.icArrowLeftCircle),
          ),
        ),
        Text(
          content ?? S.current.add_my_theme,
          style: CustomTextStyle.TITLE_16,
        ),
        const SizedBox(
          width: 25,
        )
      ],
    );
  }
}
