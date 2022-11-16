import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class CustomButton extends StatelessWidget {
  final Function onClick;
  final TextStyle? textStyle;
  final String? name;
  const CustomButton({
    Key? key,
    required this.onClick,
    this.textStyle,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            StaticColors.premium_begin_gradient,
            StaticColors.premium_end_gradient,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {
          onClick.call();
        },
        child: Text(
          name ?? S.current.save,
          style: textStyle ??
              CustomTextStyle.TITLE_14.apply(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
