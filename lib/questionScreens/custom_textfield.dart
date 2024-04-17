import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  TextInputType type = TextInputType.number;
  TextEditingController controller;

  CustomTextField(
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
        },
        keyboardType: type,
        decoration: InputDecoration(
            fillColor: Color(0xff9bbcea),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.red),
            ),
            label: Text(labelText,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w400)),
            //hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
