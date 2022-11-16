import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../home.dart';
import 'data/repositories/home_repository.dart';

import 'domain/usecases/usecases.dart';

class HomeFactory {
  HomeModule create() {
    return HomeModuleImpl();
  }
}

abstract class HomeModule extends BaseModule {

}

class HomeModuleImpl
 implements HomeModule {
  @override
  void inject(GetIt getIt) {
    // Presentation
    getIt.registerLazySingleton(
      BottomNavBloc.new,
    );
    getIt.registerLazySingleton(
      () => FirstTimeBloc(
        getFirstStatusUseCase: GetFirstStatusUseCase(
          repository: HomeRepositoryImpl(
            localDataSource: HomeLocalDataSourceImpl(
              localStorageManager: GetIt.I<LocalStorageManager>(),
            ),
          ),
        ),
        setDoneFirstUseCase: SetDoneFirstUseCase(
          repository: HomeRepositoryImpl(
            localDataSource: HomeLocalDataSourceImpl(
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
