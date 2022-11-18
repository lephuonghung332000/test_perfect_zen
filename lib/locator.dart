import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:preferences/preferences.dart';
import 'flavors.dart';
import 'module.dart';


Future<void> setup() async {
  await _injectConfig();
  await _injectCore();
  GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.splashScreen);
  await Modular.init(appModules);
}

Future<void> _injectConfig() async {
  GlobalConfiguration globalConfig;

  final _envName = describeEnum(F.appFlavor).toLowerCase();
  final _configPath = 'assets/cfg/$_envName\_env.json';

  globalConfig = await GlobalConfiguration.setup(_configPath);

  GetIt.I.registerLazySingleton<GlobalConfiguration>(() => globalConfig);
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
}

Future<void> _injectCore() async {
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  Bloc.observer = AppBlocObserver();
  CacheManager _cacheManager = await CacheManagerImpl.getInstance(
    encryptKey: GetIt.I<GlobalConfiguration>().getValue('encrypt'),
  );
  Crashlytics _crashlytics = await CrashlyticsImpl.instance();
  LocalStorageManager _localStorage =
      await LocalStorageManagerImpl.getInstance();

  HiveService hiveService = await HiveServiceImpl.getInstance();

  GetIt.I.registerLazySingleton<Crashlytics>(() => _crashlytics);
  GetIt.I.registerLazySingleton<LocalStorageManager>(() => _localStorage);
  GetIt.I.registerLazySingleton<CacheManager>(() => _cacheManager);
  GetIt.I.registerLazySingleton(() => Dio(
        BaseOptions(
          baseUrl: GetIt.I<GlobalConfiguration>().getValue('base_url'),
        ),
      ));
  GetIt.I.registerLazySingleton<AdHelper>(() => AdHelper());
  GetIt.I.registerLazySingleton<HiveService>(() => hiveService);
  GetIt.I.registerLazySingleton<AnalyticsHelper>(() => AnalyticsHelper());

  Logger logger = Logger(
    printer: PrettyPrinter(),
  );
  GetIt.I.registerLazySingleton<Logger>(() => logger);

  GetIt.I<Dio>().interceptors.addAll([
    DioLogInterceptor(
      responseBody: true,
      requestBody: true,
    ),
    // DioFirebasePerformanceInterceptor(),
  ]);

  GetIt.I.registerLazySingleton<DoorbellNetworkManager>(
      () => DoorbellNetworkManagerImpl());

  FlutterError.onError = (error) {
    GetIt.I<Crashlytics>().recordError(error);
  };
}
