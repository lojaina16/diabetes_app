import 'package:diabetes/features/Auth/pages/login.dart';
import 'package:diabetes/features/Auth/pages/register.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/pages/questions.dart';
import 'package:diabetes/features/home/emergencyCall_screen.dart';
import 'package:diabetes/features/home/healthRecord/healthrecord_screen.dart';
import 'package:diabetes/features/home/medication/medicationScreen.dart';
import 'package:diabetes/features/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    Questions.route: (context) => BlocProvider(
          create: (context) => QuestionsCubit(),
          child: const Questions(),
        ),
    HomeScreen.routeName: (context) => const HomeScreen(),
    HealthRecord.routeName: (context) => const HealthRecord(),
    EmergencyCall.routeName: (context) => const EmergencyCall(),
    MedicationFollowUp.routeName: (context) => const MedicationFollowUp()
  };
}
