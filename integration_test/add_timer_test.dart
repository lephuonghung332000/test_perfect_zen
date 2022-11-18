import 'dart:io';
import 'dart:math';

import 'package:component/component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_modular/main_dev.dart' as app;
import 'package:l10n/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late String testTitle;
  setUpAll(() {
    testTitle = 'test';
  });
  group('e2e', () {
    testWidgets('expect save timer failed because missing title',
        (tester) async {
      await app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final finder = find.byKey(TutorialKey.gestureDetectorPopUp);

      await tester.tap(finder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final buttonAddTimer =
          find.byKey(MeditationKey.meditationButtonAddTimerKey);

      await tester.tap(buttonAddTimer);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final buttonSaveTimer = find.byKey(MeditationKey.meditationSaveTimerKey);

      final titleErrorFinder =
          find.text(S.current.theme_name_must_be_1_30_characters);

      await tester.tap(buttonSaveTimer);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(titleErrorFinder, findsOneWidget);
    });

        testWidgets('expect save timer successfully', (tester) async {
      await app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final buttonAddTimer =
          find.byKey(MeditationKey.meditationButtonAddTimerKey);

      await tester.tap(buttonAddTimer);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final buttonSaveTimer = find.byKey(MeditationKey.meditationSaveTimerKey);

      final titleFormTimer = find.byKey(MeditationKey.meditationTitleTimerKey);

      await tester.enterText(titleFormTimer, testTitle);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final dropdown = find.byKey(MeditationKey.meditationDropDownTimerKey);
      await tester.tap(dropdown);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final dropdownItem = find.text('Om Mani Padme Hum').last;
      await tester.tap(dropdownItem);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      final buttonSaveMusicTimer =
          find.byKey(MeditationKey.meditationSaveMusicTimerKey);
      await tester.tap(buttonSaveMusicTimer);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(buttonSaveTimer);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final meditationFirst = tester
          .widgetList<MeditationTheme>(find.byType(MeditationTheme))
          .toList()
          .first;

      expect(meditationFirst.meditationThemeDTO.name, equals(testTitle));
      expect(true, true);
    });
  });
}
