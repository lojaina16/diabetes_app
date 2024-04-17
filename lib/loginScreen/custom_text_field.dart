import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final String hintText;
 final  String labelText;
  final String? Function(String?) validator;
  final IconData icon;
 final  TextInputType keyboardType;
 final  TextInputAction textAction;
  final bool isObscure;
  final IconData? suffixIcon;
  final TextEditingController controller;

   const CustomTextFromField(
      {super.key, this.suffixIcon,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.icon,
      required this.controller,
      this.keyboardType = TextInputType.text,
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
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 22),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red))),
        keyboardType: keyboardType,
        textInputAction: textAction,
        keyboardAppearance: Brightness.light,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        controller: controller,
        validator: validator,
        obscureText: isObscure,
      ),
    );
  }
}
