import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:review_app/review_app.dart';

class ReviewModule implements BaseModule {
  @override
  void inject(GetIt getIt) {
    getIt.registerSingleton(
      () => ReviewBloc(
        checkReviewCountUseCase: CheckReviewCountUseCase(
            repository: SettingRepositoryImpl(
          localDataSource: ReviewLocalDataSourceImpl(
            localStorageManager: GetIt.I<LocalStorageManager>(),
          ),
        )),
        saveReviewCountUseCase: SaveReviewCountUseCase(
          repository: SettingRepositoryImpl(
            localDataSource: ReviewLocalDataSourceImpl(
              localStorageManager: GetIt.I<LocalStorageManager>(),
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
