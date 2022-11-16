import 'dart:math';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:home/src/domain/usecases/usecases.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_modular/main_dev.dart' as app;
import 'package:home/home.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks(
    [HomeFactory, HomeModule, GetFirstStatusUseCase, SetDoneFirstUseCase])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final GetFirstStatusUseCase getFirstStatusUseCase =
      MockGetFirstStatusUseCase();
  final SetDoneFirstUseCase setDoneFirstUseCase = MockSetDoneFirstUseCase();
  final homeModule = MockHomeModule();
  final HomeFactory homeFactory = MockHomeFactory();

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
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byKey(TutorialKey.tutorialKey), findsNothing);
    });
  });
  setUpAll(() {
    // when(homeFactory.create()).thenReturn(homeModule);
    // // ignore: void_checks
    // when(homeModule.inject(argThat(anything))).thenReturn((expected) {
    //   GetIt.instance.registerLazySingleton(
    //     BottomNavBloc.new,
    //   );
    //   GetIt.instance.registerLazySingleton(
    //     () => FirstTimeBloc(
    //       getFirstStatusUseCase: getFirstStatusUseCase,
    //       setDoneFirstUseCase: setDoneFirstUseCase,
    //     ),
    //   );
    // });

    // when(getFirstStatusUseCase.call(NoParams()))
    //     .thenAnswer((realInvocation) => Future.value(const Right(true)));
    // when(setDoneFirstUseCase.call(NoParams()))
    //     .thenAnswer((realInvocation) => Future.value(const Right(null)));
  });
}
