import 'package:flutter/material.dart';

class CustomDownDrop extends StatefulWidget {
   final String value;
  final String txt;

  const CustomDownDrop({super.key, required this.value, required this.txt});

  @override
  State<CustomDownDrop> createState() => _CustomDownDropState();
}

class _CustomDownDropState extends State<CustomDownDrop> {
  List<String> ans = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please answer the question";
          }
          return null;
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff9bbcea),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.red),
            ),
            labelStyle: const TextStyle(fontSize: 15),
            labelText: widget.txt,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.transparent),
            )),
        value: widget.value,
        items: ans
            .map((answer) =>
                DropdownMenuItem<String>(value: answer, child: Text(answer)))
            .toList(),
        onChanged: (answer) => setState(() => ""),
      ),
    );
  }
}
//CustomTextFromField