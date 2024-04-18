import 'package:diabetes/Auth/cubit/auth_cubit.dart';
import 'package:diabetes/Auth/cubit/auth_state.dart';
import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/Auth/pages/register.dart';
import 'package:diabetes/homeScreen/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Loading(
            loading: false,
            child: Form(
              key: cubit.formKeyLogin,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  SizedBox(height: context.height * 0.3),
                  Text(
                    'Log in',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: context.height * 0.03),
                  AuthTextForm(
                    controller: cubit.emailController,
                    hintText: 'Enter your email',
                    icon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextForm(
                    controller: cubit.passwordController,
                    hintText: 'Enter your password',
                    isPassword: true,
                    icon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.height * 0.1),
                  MyButton(
                    radius: 16,
                    height: 0.06,
                    onTap: () {
                      if (cubit.formKeyLogin.currentState?.validate() ??
                          false) {
                        cubit.login();
                      }
                    },
                    text: "Log in",
                  ),
                  SizedBox(height: context.height * 0.18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: const Text(
                            'Create Now',
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthLoginError) {
            context.showSnack(state.error, isError: true);
          } else if (state is AuthLoginSuccessfully) {
            context.nextPageWitheRemove(HomeScreen.routeName);
          }
        },
      ),
    );
  }
}
