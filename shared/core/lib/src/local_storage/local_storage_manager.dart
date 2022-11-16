import 'dart:convert';

import 'package:dependencies/dependencies.dart';

abstract class LocalStorageManager {
  Future<void> instance();

  bool getBool(String key, {bool defaultValue = false});

  Future<void> saveBool({required String key, required bool value});

  Future<Map<String, dynamic>?> getJson({required String key});

  Future<void> saveInt({required String key, required int value});

  int getInt({required String key, int defaultValue = 0});

  Future<void> saveJson({required String key, required Map<String, dynamic> value});
}

class LocalStorageManagerImpl implements LocalStorageManager {
  late final SharedPreferences _prefs;

  @override
  Future<void> instance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<LocalStorageManager> getInstance() async {
    final localStorage = LocalStorageManagerImpl();
    localStorage.instance();

    return localStorage;
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  @override
  Future<Map<String, dynamic>?> getJson({required String key}) async {
    final jsonString = _prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    try {
      return jsonDecode(jsonString);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveInt({required String key, required int value}) {
    return _prefs.setInt(key, value);
  }

  @override
  Future<void> saveJson({required String key, required Map<String, dynamic> value}) async {
    try {
      final jsonString = jsonEncode(value);
      await _prefs.setString(key, jsonString);
    } catch (_) {
      rethrow;
    }
  }

  @override
  int getInt({required String key, int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }
}
