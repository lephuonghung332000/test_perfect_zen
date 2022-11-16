import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class LoadingDialog extends StatelessWidget {
  final bool barrierDismissible;
  final VoidCallback onDismiss;
  const LoadingDialog({
    Key? key,
    required this.barrierDismissible,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _DialogBackground(
      barrierDismissible: barrierDismissible,
      onDismiss: onDismiss,
      dialog: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(
              width: Dimens.dp28,
              height: Dimens.dp28,
              child: CircularProgressIndicator(strokeWidth: 1),
            ),
            SizedBox(height: Dimens.dp12),
          ],
        ),
      ),
    );
  }
}

class _DialogBackground extends StatelessWidget {
  /// Widget of dialog, you can use NDialog, Dialog,
  ///  AlertDialog or Custom your own Dialog
  final Widget? dialog;

  /// Because blur dialog cover the barrier, you have to declare here
  final bool? barrierDismissible;

  /// Action before dialog dismissed
  final Function? onDismiss;

  const _DialogBackground({
    this.dialog,
    this.barrierDismissible,
    this.onDismiss,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.black.withOpacity(0.5),
      child: WillPopScope(
        onWillPop: () async {
          if (barrierDismissible ?? true) {
            if (onDismiss != null) onDismiss!();
          }
          Navigator.pop(context);
          return null!;
        },
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: barrierDismissible ?? true
                    ? () {
                        if (onDismiss != null) {
                          onDismiss!();
                        }
                        Navigator.pop(context);
                      }
                    : () {},
                child: Container(
                  color: Colors.transparent,
                )),
            dialog!
          ],
        ),
      ),
    );
  }
}
