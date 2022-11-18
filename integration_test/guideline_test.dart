import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_modular/main_dev.dart' as app;
import 'package:meditation_theme/meditation_theme.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e', () {
    testWidgets('show guideline first time and tap to hide', (tester) async {
      await app.main();
      await tester.pumpAndSettle();
      final popUp = find.byKey(TutorialKey.tutorialKey);
      expect(popUp, findsOneWidget);

      final finder = find.byKey(TutorialKey.gestureDetectorPopUp);

      await tester.tap(finder);
      await tester.pumpAndSettle();

      expect(popUp, findsNothing);
    });

    testWidgets('not show guideline for second time', (tester) async {
      await app.main();
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(TutorialKey.tutorialKey), findsNothing);
    });

  });
}
