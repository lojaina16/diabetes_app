import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  TextInputType type = TextInputType.number;

  CustomTextField({required this.labelText, this.type = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please answer the question";
          }
        },
        keyboardType: type,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            label: Text(labelText),
            //hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.indigoAccent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.indigoAccent))),
      ),
    );
  }
}
