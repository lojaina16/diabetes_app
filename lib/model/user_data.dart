

import 'package:diabetes/core/cache_helper.dart';

class UserData {
  static String? uid;

  static Future<bool> clearUserData() async {
    uid = null;
    return CacheHelper.clear;
  }
  
}