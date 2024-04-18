import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldColorLight,
    brightness: Brightness.light,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white.withOpacity(0.6),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      margin: EdgeInsets.all(0),
    ),
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white.withOpacity(0.6),
    unselectedWidgetColor: AppColors.white3,
    dividerColor: Colors.black,
    disabledColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.statusBarColorLight,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark)),
    textTheme: TextTheme(
        displayLarge: const TextStyle(
            fontSize: 45,
            color: AppColors.gradient,
            fontWeight: FontWeight.w600),
        displayMedium: const TextStyle(
            fontSize: 42, color: Colors.black, fontWeight: FontWeight.w600),
        labelSmall: const TextStyle(color: Colors.black, fontSize: 11),
        bodyMedium: const TextStyle(color: Colors.black, fontSize: 14),
        bodySmall: TextStyle(color: AppColors.black3, fontSize: 15),
        bodyLarge: const TextStyle(fontSize: 30, color: Colors.black)),
    iconTheme: const IconThemeData(color: Colors.black));
