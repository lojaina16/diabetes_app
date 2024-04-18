

import 'package:diabetes/homeScreen/emergencyCall_screen.dart';
import 'package:diabetes/homeScreen/medication/medicationScreen.dart';
import 'package:diabetes/questionScreens/output_screen1.dart';
import 'package:diabetes/questionScreens/output_screen2.dart';
import 'package:diabetes/questionScreens/quesions_screen.dart';
import 'package:flutter/material.dart';

import 'homeScreen/categories.dart';
import 'homeScreen/healthRecord/healthrecord_screen.dart';
import 'loginScreen/login.dart';
import 'loginScreen/register.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        Question.routeName: (context) => const Question(),
        OutputScreen1.routeName: (context) => OutputScreen1(),
        HomeScreen.routeName: (context) => HomeScreen(),
        OutputScreen2.routeName: (context) => OutputScreen2(),
        HealthRecord.routeName: (context) => const HealthRecord(),
        EmergencyCall.routeName: (context) => const EmergencyCall(),
        MedicationFollowUp.routeName: (context) => const MedicationFollowUp()
      },
    );
  }
}