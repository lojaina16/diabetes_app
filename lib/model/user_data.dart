import 'package:diabetes/core/cache_helper.dart';

class UserData {
  static String? uid;
  static String? debatesType;

  static Future<bool> clearUserData() async {
    uid = null;
    debatesType = null;
    return CacheHelper.clear;
  }
}
