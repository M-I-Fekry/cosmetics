import 'package:cosmetics/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setIsNotFirstTime() {
    _prefs.setBool("isFirstTime", false);
  }

  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime") ?? true;
  }

  static void setEmail(String email) {
    _prefs.setString("email", email);
  }

  static String get email {
    return _prefs.getString("email") ?? "";
  }

  static String get image {
    var image = _prefs.getString("profilePhotoUrl");

    if (image == null || image.isEmpty) {
      image =
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=200&auto=format&fit=crop";
    }
    return image;
  }

  static bool get isAuth {
    return token.isNotEmpty;
  }

  static String get token {
    return _prefs.getString("token") ?? "Hi Visitor!";
  }

  static String get name {
    return _prefs.getString("username") ?? "";
  }

  static Future<void> saveUserData({UserData? data, UserModel? model}) async {
    if (data == null && model == null) return;

    if (data != null) {
      _prefs.setString("token", data.token);
      model = data.user;
    }

    if (model != null) {
      _prefs.setInt("id", model.id);
      _prefs.setString("username", model.username);
      _prefs.setString("countryCode", model.countryCode);
      _prefs.setString("phoneNumber", model.phoneNumber);
      _prefs.setString("email", model.email);
      _prefs.setString("role", model.role);
      _prefs.setString("profilePhotoUrl", model.profilePhotoUrl);
    }
  }

  static Future<void> logout() async {
    await _prefs.remove("token");
    await _prefs.remove("id");
    await _prefs.remove("username");
    await _prefs.remove("phoneNumber");
    await _prefs.remove("countryCode");
    await _prefs.remove("profilePhotoUrl");
    await _prefs.remove("role");
    await _prefs.remove("email");
  }
}
