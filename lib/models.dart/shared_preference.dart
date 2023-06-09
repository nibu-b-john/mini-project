import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preferences {
  static late SharedPreferences _preferences;
  static const _keyToken = "token";
  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setString(String token) async {
    await _preferences.setString(_keyToken, token);
  }

  static getString() async {
    return _preferences.getString(_keyToken);
  }
}
