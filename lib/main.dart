import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dibates/homeScreen/emergencyCall_screen.dart';
import 'package:dibates/homeScreen/medication/medicationScreen.dart';
import 'package:dibates/questionScreens/output_screen1.dart';
import 'package:dibates/questionScreens/output_screen2.dart';
import 'package:dibates/questionScreens/quesions_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'homeScreen/categories.dart';
import 'homeScreen/healthRecord/healthrecord_screen.dart';
import 'loginScreen/login.dart';
import 'loginScreen/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Question.routeName,
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
