import 'package:flutter/material.dart';
import 'flavors.dart';

import 'app.dart';
import 'locator.dart';

Future<void> main() async {
  F.appFlavor = Flavor.PROD;
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const App());
}
