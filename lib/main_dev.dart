import 'package:flutter/material.dart';
import 'flavors.dart';

import 'app.dart';
import 'locator.dart';

bool isLoad = false;

Future<void> main() async {
  if (!isLoad) {
    isLoad = true;
    F.appFlavor = Flavor.DEV;
    WidgetsFlutterBinding.ensureInitialized();
    await setup();
  }

  runApp(const App());
}
