import 'package:flutter/material.dart';

class DialogSetting extends StatelessWidget {
  final String title;
  final Widget body;
  final bool? barrierDismissible;

  const DialogSetting({
    super.key,
    required this.title,
    required this.body,
    this.barrierDismissible,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  static const route = 'dialog_setting';

  static void showDialogSetting({
    required BuildContext context,
    required String title,
    required Widget body,
    bool? barrierDismissible,
  }) {
    showDialog(
        barrierDismissible: barrierDismissible ?? false,
        context: context,
        routeSettings: const RouteSettings(name: DialogSetting.route),
        builder: (BuildContext contex) {
          return DialogSetting(
            body: body,
            title: title.toUpperCase(),
          );
        });
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                body,
              ],
            ),
          ),
        )
      ],
    );
  }
}
