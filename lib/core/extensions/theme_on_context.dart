import 'package:diabetes/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


extension ThemeManger on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  IconThemeData get iconTheme => theme.iconTheme;
  Color get cardColor => theme.cardColor;
  SystemUiOverlayStyle get statusTheme => theme.appBarTheme.systemOverlayStyle!;
  Brightness get brightness => MediaQuery.of(this).platformBrightness;
 
  bool get isDarkMode {
    if (UserData.theme == null) {
      return brightness == Brightness.dark;
    }
    return UserData.theme == 'Dark';
  }
}