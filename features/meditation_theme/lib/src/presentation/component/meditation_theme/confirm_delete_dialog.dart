import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final MeditationThemeDTO theme;

  const ConfirmDeleteDialog({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = theme.name;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          S.current.delete_confirmation,
          style: CustomTextStyle.TITLE_14.apply(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: CustomTextStyle.BODY_14.apply(
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: S.current.are_you_sure_to_permanently_delete_theme,
              ),
              TextSpan(
                text: name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: S.current.question_mask,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonDialog(
                text: S.current.discard,
                style: ActionButtonStyle.empty,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ButtonDialog(
                text: S.current.confirm,
                style: ActionButtonStyle.filled,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
