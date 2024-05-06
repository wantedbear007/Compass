import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// currently using shared_preferences

// to save values to local storage
Future<bool> saveToLocal(String key, String value) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  try {
    await sharedPreferences.setString(key, value);
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
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  try {
    final value = sharedPreferences.get(key);

    if (value is T) {
      return value;
    }
  } catch (err) {
    return null;
  }
  return null;

}
