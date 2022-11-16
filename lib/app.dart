import 'dart:io';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:reports/report.dart';
import 'package:review_app/review_app.dart';
import 'package:settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home/home.dart';
import 'package:l10n/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final String defaultLocale = Platform.localeName.split('_')[0];
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<SessionMeditationBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<BottomNavBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<FirstTimeBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<SubscriptionBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<MusicBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<TransactionBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<MeditationThemeBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<DownloadMusicBloc>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => GetIt.I<ReviewBloc>(),
          ),
        ],
        child: MaterialApp(
          builder: EasyLoading.init(),
          navigatorKey: Routes.navigatorStateKey,
          title: F.title,
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale(
            defaultLocale,
          ),
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: Modular.routes,
          home: MainPage(),
        ));
  }
}
