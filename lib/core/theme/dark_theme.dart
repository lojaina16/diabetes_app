import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldColorDark,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.statusBarColorDark,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.darkDialogColor,
    ),
    dividerColor: Colors.white,
    disabledColor: AppColors.black3,
    cardTheme: CardTheme(
      elevation: 0,
      color: AppColors.black4,
      margin: const EdgeInsets.all(0),
    ),
    cardColor: AppColors.black4,
    unselectedWidgetColor: AppColors.black3,
    dialogBackgroundColor: AppColors.darkDialogColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.statusBarColorDark,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        )),
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
        displayMedium: TextStyle(
            fontSize: 42, color: Colors.white, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(color: Colors.white, fontSize: 11),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
        bodySmall: TextStyle(color: AppColors.white3, fontSize: 12),
        bodyLarge: TextStyle(fontSize: 30, color: Colors.white)),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ));
