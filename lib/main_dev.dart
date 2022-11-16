import 'package:flutter/material.dart';
import 'flavors.dart';

import 'app.dart';
import 'locator.dart';

Future<void> main() async {
  F.appFlavor = Flavor.DEV;
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const App());
}
