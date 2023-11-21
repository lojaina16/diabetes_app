import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_app/questionScreens/femaleTypeQuestion.dart';
import 'package:diabetes_app/questionScreens/quesions_screen.dart';
import 'package:diabetes_app/questionScreens/questions2_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'homeScreen/categories.dart';
import 'loginScreen/login.dart';
import 'loginScreen/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        Question.routeName: (context) => Question(),
        Question2.routeName: (context) => Question2(),
        FemaleQuestions.routeName: (context) => FemaleQuestions(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
