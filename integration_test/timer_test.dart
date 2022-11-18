import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_modular/main_dev.dart' as app;
import 'package:meditation_theme/meditation_theme.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e', () {
    testWidgets('show list timer and button add timer', (tester) async {
      await app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final finder = find.byKey(TutorialKey.gestureDetectorPopUp);

      await tester.tap(finder);
      await tester.pumpAndSettle();

      final meditationList =
          tester.widgetList(find.byType(MeditationTheme)).length;
      expect(meditationList > 0, true);

      final buttonAddTimer =
          find.byKey(MeditationKey.meditationButtonAddTimerKey);
      expect(buttonAddTimer, findsOneWidget);
    });
    
  });
}
