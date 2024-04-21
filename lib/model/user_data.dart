import 'package:diabetes/core/cache_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
void Function(NotificationResponse)? onDidReceiveNotificationResponse;