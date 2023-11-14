import 'package:flutter/material.dart';

import 'customDownDrop.dart';

class FemaleQuestions extends StatefulWidget {
  static const String routeName = "FemaleQuestion";

  @override
  State<FemaleQuestions> createState() => _QuestionState();
}

class _QuestionState extends State<FemaleQuestions> {
  String? selectedGender;
  String? selectedAns1;
  String? selectedAns2;
  String? selectedAns3;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ;
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
                CustomDownDrop(value: selectedAns1, txt: "A"),
                CustomDownDrop(value: selectedAns2, txt: "B"),
                CustomDownDrop(value: selectedAns3, txt: "C"),
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
