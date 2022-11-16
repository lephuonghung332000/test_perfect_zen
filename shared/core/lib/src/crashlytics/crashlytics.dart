import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

abstract class Crashlytics {
  Future<void> initialize();

  Future<void> recordError(FlutterErrorDetails errorDetails);
}

class CrashlyticsImpl implements Crashlytics {
  final _instance = FirebaseCrashlytics.instance;

  static Future<Crashlytics> instance() async {
    final crashlytics = CrashlyticsImpl();
    await crashlytics.initialize();
    return crashlytics;
  }

  @override
  Future<void> initialize() async {
    if (kDebugMode) {
      await _instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await _instance.setCrashlyticsCollectionEnabled(true);
    }
  }

  @override
  Future<void> recordError(FlutterErrorDetails errorDetails) {
    return _instance.recordError(errorDetails.exception, errorDetails.stack);
  }
}
