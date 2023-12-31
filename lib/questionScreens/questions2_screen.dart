import 'package:flutter/material.dart';

import 'customDownDrop.dart';
import 'custom_textfield.dart';

class Question2 extends StatefulWidget {
  static const String routeName = "question2";

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  List<String> ans = ["Yes", "No"];
  String? selectedAns1;
  String? selectedAns2;
  String? selectedAns3;
  String? selectedAns4;
  String? selectedAns5;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Type detection questions",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          toolbarHeight: 150,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //SizedBox(height: 20),

                CustomTextField(labelText: "A", type: TextInputType.number),
                CustomDownDrop(value: selectedAns2, txt: "B"),
                CustomDownDrop(value: selectedAns3, txt: "C"),
                CustomDownDrop(value: selectedAns4, txt: "D"),
                CustomDownDrop(value: selectedAns4, txt: "E"),

                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        return;
                      }
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
