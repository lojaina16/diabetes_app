import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  String hintText;
  String labelText;
  String? Function(String?) validator;
  IconData icon;
  TextInputType keyboardTybe;
  TextInputAction textAction;
  bool isObscure;
  IconData? suffixIcon;
  TextEditingController controller;

  CustomTextFromField(
      {this.suffixIcon,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.icon,
      required this.controller,
      this.keyboardTybe = TextInputType.text,
      this.isObscure = false,
      this.textAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.grey,
            ),
            prefixIcon: Icon(icon, color: Colors.blue),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 22),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red))),
        keyboardType: keyboardTybe,
        textInputAction: textAction,
        keyboardAppearance: Brightness.light,
        style: TextStyle(color: Colors.black, fontSize: 20),
        controller: controller,
        validator: validator,
        obscureText: isObscure,
      ),
    );
  }
}
