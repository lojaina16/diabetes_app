import 'package:diabetes/Auth/cubit/auth_cubit.dart';
import 'package:diabetes/Auth/cubit/auth_state.dart';
import 'package:diabetes/Auth/widgets/google_button.dart';
import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/homeScreen/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSingUpError) {
          context.showSnack(state.error, isError: true);
        } else if (state is AuthSingUpSuccessfully) {
          context.nextPageWitheRemove(HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        final cubit = AuthCubit.get(context);
        return Loading(
          loading: state is AuthSingUpLoading,
          child: Form(
            key: cubit.formKeySingUp,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                AuthTextForm(
                  controller: cubit.nameController,
                  hintText: 'Enter your Username',
                  icon: Icons.person,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter username';
                    }
                    return null;
                  },
                  textInputType: TextInputType.name,
                ),
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
                AuthTextForm(
                  controller: cubit.mobileNumberController,
                  hintText: 'Enter your mobile number',
                  icon: Icons.call,
                  textInputType: TextInputType.number,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter mobile number';
                    }
                    return null;
                  },
                ),
                AuthTextForm(
                  controller: cubit.passwordController,
                  hintText: 'Enter your password',
                  textInputType: TextInputType.visiblePassword,
                  icon: Icons.lock,
                  isPassword: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter password';
                    }
                    if (text.length < 6) {
                      return 'password should be at least 6';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.04),
                MyButton(
                  radius: 16,
                  height: 0.06,
                  onTap: () {
                    if (cubit.formKeySingUp.currentState?.validate() ?? false) {
                      cubit.login();
                    }
                  },
                  text: "Sing Up",
                ),
                GoogleButton(cubit: cubit),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    TextButton(
                        onPressed: () {
                          context.pop;
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
