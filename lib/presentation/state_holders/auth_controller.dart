import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;

  static String? get accessToken => _accessToken;

  /// set user token
  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

  /// get user token
  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
   await sharedPreferences.clear();
  }

  /// user already logged in or not
  static bool isLoggedIn() {
    return _accessToken != null;
  }
}
