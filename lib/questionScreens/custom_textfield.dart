import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 final  String labelText;
  final TextInputType type ;
  final TextEditingController controller;

  const CustomTextField(
      {super.key, required this.labelText,
      this.type = TextInputType.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please answer the question";
          }
          return null;
        },
        keyboardType: type,
        decoration: InputDecoration(
            fillColor: const Color(0xff9bbcea),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.red),
            ),
            label: Text(labelText,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400)),
            //hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
