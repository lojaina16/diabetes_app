import 'package:diabetes/Auth/cubit/auth_cubit.dart';
import 'package:diabetes/core/routes/routes.dart';
import 'package:diabetes/core/theme/dark_theme.dart';
import 'package:diabetes/core/theme/light_theme.dart';
import 'package:diabetes/homeScreen/categories.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Auth/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:
            UserData.uid != null ? HomeScreen.routeName : LoginScreen.routeName,
        themeMode: ThemeMode.light,
        darkTheme: darkTheme,
        theme: lightTheme,
        routes: Routes.routes,
      ),
    );
  }
}
