import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class ConfirmFinishMeditationDialog extends StatelessWidget {
  final VoidCallback onDiscarded;
  final VoidCallback onConfirmed;
  const ConfirmFinishMeditationDialog({
    Key? key,
    required this.onConfirmed,
    required this.onDiscarded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          S.current.stop_confirmation,
          style: CustomTextStyle.TITLE_14.apply(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonDialog(
                text: S.current.discard,
                style: ActionButtonStyle.empty,
                onPressed: onDiscarded,
              ),
              ButtonDialog(
                text: S.current.confirm,
                style: ActionButtonStyle.filled,
                onPressed: onConfirmed,
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
