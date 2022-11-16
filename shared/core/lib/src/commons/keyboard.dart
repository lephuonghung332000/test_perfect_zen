import 'package:flutter/cupertino.dart';

class Keyboard {
  static void hide(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
