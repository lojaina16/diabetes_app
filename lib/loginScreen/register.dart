import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'login.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = 'register screen';
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Center(
                    child: Text(
                  'Register',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                )),
                Center(
                  child: Text('Create a new account',
                      style: TextStyle(color: Colors.grey, fontSize: 25)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // Text('Username',style: TextStyle(color: Colors.white,fontSize:21,fontWeight: FontWeight.normal ),),
                CustomTextFromField(
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
                  hintText: 'Enter your mobile number',
                  labelText: 'Mobile Number',
                  icon: Icons.call,
                  keyboardTybe: TextInputType.number,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter mobile number';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  textAction: TextInputAction.done,
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }
                    },
                    child: Text('Login', style: TextStyle(fontSize: 20)),
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
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ))
                  ],
                ),
              ]),
        ),
      ))
    ]));
  }
}
