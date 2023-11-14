import 'package:diabetes_app/questionScreens/questions2_screen.dart';
import 'package:flutter/material.dart';

import 'customDownDrop.dart';
import 'custom_textfield.dart';
import 'femaleTypeQuestion.dart';

class Question extends StatefulWidget {
  static const String routeName = "questionScreen";

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<String> gender = ["Male", "Female"];
  String? selectedGender;
  String? selectedAns1;
  String? selectedAns2;
  String? selectedAns3;
  String? selectedAns4;
  String? selectedAns5;
  String? selectedAns6;
  String? selectedAns7;
  String? selectedAns8;
  String? selectedAns9;
  String? selectedAns10;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Diabetes detection questions",
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
                CustomTextField(
                    labelText: "Enter Your Age", type: TextInputType.number),
                Padding(
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
                        labelText: "Choose your gender",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.indigoAccent))),
                    value: selectedGender,
                    items: gender
                        .map((gen) => DropdownMenuItem<String>(
                            value: gen, child: Text(gen)))
                        .toList(),
                    onChanged: (gen) => setState(() => selectedGender = gen),
                  ),
                ),
                CustomDownDrop(
                    value: selectedAns1, txt: "Do you feel extreme thirst?"),
                CustomDownDrop(
                    value: selectedAns2,
                    txt: "Do you have a sudden weight loss?"),
                CustomDownDrop(
                    value: selectedAns3, txt: "Do you feel extreme hunger?"),
                CustomDownDrop(
                    value: selectedAns4,
                    txt: "increased or frequent urination?"),
                CustomDownDrop(
                    value: selectedAns5, txt: "Do you have partial paresis"),
                CustomDownDrop(
                    value: selectedAns6, txt: "Do you have hair loss?"),
                CustomDownDrop(
                    value: selectedAns7, txt: "Do you have mood changes?"),
                CustomDownDrop(
                    value: selectedAns8,
                    txt: "Do your cuts take longer to heal?"),
                CustomDownDrop(
                    value: selectedAns9, txt: "Do you suffer from itching?"),
                CustomDownDrop(
                    value: selectedAns10, txt: "Do you have muscle stiffness?"),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Navigator.pushNamed(context, Question2.routeName);
                      }
                      if (selectedGender == "Female") {
                        Navigator.pushNamed(context, FemaleQuestions.routeName);
                      } else if (selectedGender == "Male") {
                        Navigator.pushNamed(context, Question2.routeName);
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
