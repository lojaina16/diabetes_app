import 'package:diabetes_app/questionScreens/femaleTypeQuestion.dart';
import 'package:diabetes_app/questionScreens/quesions_screen.dart';
import 'package:diabetes_app/questionScreens/questions2_screen.dart';
import 'package:flutter/material.dart';

import 'loginScreen/login.dart';
import 'loginScreen/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        Question.routeName: (context) => Question(),
        Question2.routeName: (context) => Question2(),
        FemaleQuestions.routeName: (context) => FemaleQuestions()
      },
    );
  }
}
