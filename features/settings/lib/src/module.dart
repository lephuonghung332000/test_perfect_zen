import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingModule implements BaseModule {
  @override
  void inject(GetIt getIt) {
    getIt.registerLazySingleton(() => TransactionHiveServiceImpl());
    getIt<TransactionHiveServiceImpl>().registerAdapterHive();

    getIt.registerFactory(
      () => FeedbackBloc(
        sendFeedBackUseCase: SendFeedBackUseCase(
            repository: SettingRepositoryImpl(
          dataSource: FeedbackNetworkDataSourceImpl(
            networkManager: GetIt.I<DoorbellNetworkManager>(),
          ),
        )),
      ),
    );

    getIt.registerFactory(
      () => TransactionBloc(
        getCurrentTransactionUseCase: GetCurrentTransactionUseCase(
            repository: TransactionRepositoryImpl(
          settingLocalDataSource: SettingLocalDataSourceImpl(
              transactionHiveService: TransactionHiveServiceImpl()),
          transactionApiDataSource: TransactionApiDataSourceImpl(),
        )),
      ),
    );

    getIt.registerFactory(
      () => SubscriptionBloc(
        createTransactionUseCase: CreateTransactionUseCase(
            repository: TransactionRepositoryImpl(
          settingLocalDataSource: SettingLocalDataSourceImpl(
              transactionHiveService: TransactionHiveServiceImpl()),
          transactionApiDataSource: TransactionApiDataSourceImpl(),
        )),
      ),
    );
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {};
  }
}
