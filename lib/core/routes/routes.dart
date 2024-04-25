import 'package:diabetes/features/Auth/pages/login.dart';
import 'package:diabetes/features/Auth/pages/register.dart';
import 'package:diabetes/features/Emergency/presentation/pages/emergency_call_screen.dart';
import 'package:diabetes/features/Medication/presentation/pages/medication_page.dart';
import 'package:diabetes/features/Nutrition/presentation/pages/nutrition_page.dart';
import 'package:diabetes/features/Questions/presentation/pages/detect_diabetes.dart';
import 'package:diabetes/features/Questions/presentation/pages/insert_user_info.dart';
import 'package:diabetes/features/Questions/presentation/pages/questions.dart';
import 'package:diabetes/features/Settings/presentation/pages/setting.dart';
import 'package:diabetes/features/Settings/presentation/pages/theme.dart';
import 'package:diabetes/features/home/healthRecord/healthrecord_screen.dart';
import 'package:diabetes/features/home/pages/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    Questions.route: (context) => const Questions(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    HealthRecord.routeName: (context) => const HealthRecord(),
    EmergencyCall.route: (context) => const EmergencyCall(),
    DetectDiabetes.route:(context) => const DetectDiabetes(),
    SettingPage.route:(context) => const SettingPage(),
    ThemeModeSettings.route:(context) => const ThemeModeSettings(),
    UserInfoPage.route:(context) => const UserInfoPage(),
    MedicationPage.route:(context) => const MedicationPage(),
    NutritionPage.route:(context) => const NutritionPage(),
  };
}
