import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final bool? barrierDismissible;

  const CustomDialog({
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

  static Future showConfirmDialog({
    required BuildContext context,
    required String title,
    required Widget body,
    bool? barrierDismissible,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible ?? false,
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          body: body,
          title: title.toUpperCase(),
        );
      },
    );
  }

  static Future showDownloadingDialog({
    required BuildContext context,
    required Widget body,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          body: body,
          title: '',
        );
      },
    );
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
                _buildTitle(),
                body,
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 2,
      style: CustomTextStyle.TITLE_14.apply(
        color: Colors.white,
      ),
    );
  }
}
