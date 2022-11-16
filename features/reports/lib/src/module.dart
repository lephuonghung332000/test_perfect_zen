import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:reports/report.dart';
import 'domain/usecases/usecase.dart';

class ReportModule implements BaseModule {
  @override
  void inject(GetIt getIt) async {
    getIt.registerLazySingleton(
      () => SessionMeditationBloc(
        getListSessionMeditationUseCase: GetListSessionMeditationThemeUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService: GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
        addSessionMeditationUseCase: AddSessionMeditationUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService: GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
        getTimeSessionMeditationUseCase: GetTimesSessionMeditationUseCase(
          repository: MeditationThemeImpl(
            meditationThemeLocalDataSource: MeditationThemeLocalDataSourceImpl(
              meditationThemeHiveService: GetIt.I<MeditationThemeHiveServiceImpl>(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {};
  }
}
