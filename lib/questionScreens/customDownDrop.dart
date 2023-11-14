import 'package:flutter/material.dart';

class CustomDownDrop extends StatefulWidget {
  String? value;
  String txt;

  CustomDownDrop({required this.value, required this.txt});

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
        },
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            labelStyle: TextStyle(fontSize: 15),
            labelText: widget.txt,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.indigoAccent)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.indigoAccent),
            )),
        value: widget.value,
        items: ans
            .map((answer) =>
                DropdownMenuItem<String>(value: answer, child: Text(answer)))
            .toList(),
        onChanged: (answer) => setState(() => widget.value = answer),
      ),
    );
  }
}
