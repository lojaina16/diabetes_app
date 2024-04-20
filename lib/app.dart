import 'package:diabetes/core/routes/routes.dart';
import 'package:diabetes/core/theme/dark_theme.dart';
import 'package:diabetes/core/theme/light_theme.dart';
import 'package:diabetes/features/Auth/cubit/auth_cubit.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/pages/questions.dart';
import 'package:diabetes/features/Settings/presentation/cubit/settings_cubit.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/pages/home.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/Auth/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => QuestionsCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        )
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = SettingsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: UserData.uid != null && UserData.debatesType != null
                ? HomeScreen.routeName
                : UserData.uid != null && UserData.debatesType == null
                    ? Questions.route
                    : LoginScreen.routeName,
            themeMode: cubit.themeMode,
            darkTheme: darkTheme,
            theme: lightTheme,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
