import 'package:core/core.dart';
import 'package:flutter/material.dart';

class Toast {
  const Toast({
    Key? key,
  });

  static void show({required String message}) {
    final scaffold = ScaffoldMessenger.of(Routes.navigatorStateKey.currentContext!);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
