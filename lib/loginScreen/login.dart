import 'package:diabetes_app/loginScreen/register.dart';
import 'package:diabetes_app/questionScreens/quesions_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../dialog_utils.dart';
import 'custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  const Center(
                      child: Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30),
                  )),
                  const Text('Login to your account',
                      style: TextStyle(color: Colors.grey, fontSize: 25)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomTextFromField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    labelText: 'Email Address',
                    icon: Icons.email,
                    keyboardTybe: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFromField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    suffixIcon: Icons.visibility_off,
                    icon: Icons.lock,
                    isObscure: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter password';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 130))),
                      child: const Text('Login', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
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
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  void login() async {
    if (_formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context, 'loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text);
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context,
          'Login Successfully',
          title: 'Success',
          postActionName: "ok",
          barrierDismissible: false,
          postAction: () {
            Navigator.pushNamed(context, Question.routeName);
          },
        );
        print('login successfully');
        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'No user found for that email.',
              title: 'Error', postActionName: "ok", barrierDismissible: false);
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, 'Wrong password provided for that user.',
              title: 'Error', postActionName: "ok", barrierDismissible: false);
          print('Wrong password provided for that user.');
        } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, 'Wrong password or no user found for that email.',
              title: 'Error', postActionName: "ok", barrierDismissible: false);
          print('Wrong password or no user found for that email.');
        }
      } catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, e.toString(),
            title: 'Error', postActionName: "ok", barrierDismissible: false);
        print(e);
      }
    }
  }
}
