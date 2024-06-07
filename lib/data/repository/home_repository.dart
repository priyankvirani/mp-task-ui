
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  final SharedPreferences sharedPreferences;

  HomeRepository({required this.sharedPreferences});

  clearSharedPref() {
    sharedPreferences.clear();
  }

  // String getUserToken() {
  //   return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  // }

  // setUserToken(String token) {
  //   sharedPreferences.setString(AppConstants.TOKEN, token);
  // }

  setSharedPrefString(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  String getSharedPrefString(String key) {
    return sharedPreferences.getString(key) ?? "";
  }

  setSharedPrefInt(String key, int value) {
    sharedPreferences.setInt(key, value);
  }

  int getSharedPrefInt(String key) {
    return sharedPreferences.getInt(key) ?? 0;
  }

  setSharedPrefBool(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  bool getSharedPrefBool(String key) {
    return sharedPreferences.getBool(key) ?? false;
  }
}

