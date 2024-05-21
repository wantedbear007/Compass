import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// currently using shared_preferences
class LocalStorageServices {
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _sharedPreferences async =>
      _prefs ??= await SharedPreferences.getInstance();

  Future<bool> saveToLocal(String key, String value) async {
    final SharedPreferences instance = await _sharedPreferences;

    try {
      await instance.setString(key, value);
      return true;
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
      return false;
    }
  }

// get data from local storage
  Future<T?> getFromLocal<T>(String key) async {
    final SharedPreferences instance = await _sharedPreferences;
    try {
      final value = instance.get(key);

      if (value is T) {
        return value;
      }
    } catch (err) {
      return null;
    }
    return null;
  }

// to check if data exists in local storage
  Future<bool> checkLocalStorage(String key) async {
    try {
      final SharedPreferences instance = await _sharedPreferences;
      return instance.containsKey(key);
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
      return false;
    }
  }

//  delete from local
  Future<void> removeFromLocal(String key) async {
    try {
      final SharedPreferences instance = await _sharedPreferences;
      await instance.remove(key);
    } catch (err) {
      if (kDebugMode) {
        print("Error in deleting from local storage $err");
      }
    }
  }
}
