import 'package:diabetes_app/questionScreens/quesions_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dialog_utils.dart';
import 'custom_text_field.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String routeName = 'register screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameControlller = TextEditingController();

  var emailControlller = TextEditingController();

  var passwordControlller = TextEditingController();

  var MobileNumberControlller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Center(
                    child: Text(
                  'Register',
                  style: TextStyle(fontSize: 30),
                )),
                Center(
                  child: Text('Create a new account',
                      style: TextStyle(color: Colors.grey, fontSize: 25)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // Text('Username',style: TextStyle(color: Colors.white,fontSize:21,fontWeight: FontWeight.normal ),),
                CustomTextFromField(
                  controller: nameControlller,
                  hintText: 'Enter your Username',
                  labelText: 'User Name',
                  icon: Icons.person,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter username';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  controller: emailControlller,
                  hintText: 'Enter your email',
                  labelText: 'Email Address',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter email';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  controller: MobileNumberControlller,
                  hintText: 'Enter your mobile number',
                  labelText: 'Mobile Number',
                  icon: Icons.call,
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter mobile number';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  controller: passwordControlller,
                  hintText: 'Enter your password',
                  suffixIcon: Icons.visibility_off,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscure: true,
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
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Register();
                    },
                    child: Text('Login', style: TextStyle(fontSize: 16)),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 11, horizontal: 130))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              ]),
        ),
      ))
    ]));
  }

  void Register() async {
    if (_formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context, 'loading...');

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailControlller.text,
          password: passwordControlller.text,
        );
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, 'Register Successfully',
            title: 'Success',
            postActionName: "ok",
            barrierDismissible: false, postAction: () {
          Navigator.pushNamed(context, Question.routeName);
        });

        print('register successfully');
        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'The password provided is too weak.',
              title: 'Error', postActionName: "ok", barrierDismissible: false);
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, 'The account already exists for that email.',
              title: 'Error', postActionName: "ok", barrierDismissible: false);
          print('The account already exists for that email.');
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
