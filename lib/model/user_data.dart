import 'package:diabetes/core/cache_helper.dart';

class UserData {
  static String? uid;
  static String? debatesType;
  static String? theme;

  static Future<bool> clearUserData() async {
    uid = null;
    debatesType = null;
    theme = null;
    return CacheHelper.clear;
  }
}
