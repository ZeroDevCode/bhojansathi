import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static Future<bool> saveUserData(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

// Read Data
  static Future<String> getUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(value) as String;
  }
}
