import 'package:diabetes_app/model/user_info.dart';
import 'package:diabetes_app/questionScreens/questions2_screen.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import 'customDownDrop.dart';
import 'custom_textfield.dart';

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
  String? selectedAns11;
  String? selectedAns12;
  String? selectedAns13;
  bool isVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          interactive: true,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                      labelText: "Enter Your Age",
                      type: TextInputType.number,
                      controller: ageController),
                  CustomTextField(
                      labelText: "Enter Your Weight",
                      type: TextInputType.number,
                      controller: weightController),
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
                      onChanged: (gen) => setState(() {
                        //selectedGender = gen;
                        genderController.text = gen!;
                      }),
                    ),
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: selectedGender == "Female"
                            ? isVisible = true
                            : selectedGender == "Male"
                            ? isVisible = false
                            : isVisible,
                        child: Container(
                          child: Column(
                            children: [
                              CustomDownDrop(
                                  value: selectedAns11,
                                  txt: "Are you pregnant now?"),
                              CustomDownDrop(
                                  value: selectedAns12,
                                  txt: "Do you have previous pregnancies"),
                              CustomDownDrop(
                                  value: selectedAns13,
                                  txt:
                                  "Are you affected by high blood pressure when you were pregnant?"),
                            ],
                          ),
                        ),
                      ),
                      CustomDownDrop(
                          value: selectedAns1,
                          txt: "Do you feel extreme thirst?"),
                      CustomDownDrop(
                          value: selectedAns2,
                          txt: "Do you have a sudden weight loss?"),
                      CustomDownDrop(
                          value: selectedAns3,
                          txt: "Do you feel extreme hunger?"),
                      CustomDownDrop(
                          value: selectedAns4,
                          txt: "increased or frequent urination?"),
                      CustomDownDrop(
                          value: selectedAns5,
                          txt: "Do you have partial paresis"),
                      CustomDownDrop(
                          value: selectedAns6, txt: "Do you have hair loss?"),
                      CustomDownDrop(
                          value: selectedAns7,
                          txt: "Do you have mood changes?"),
                      CustomDownDrop(
                          value: selectedAns8,
                          txt: "Do your cuts take longer to heal?"),
                      CustomDownDrop(
                          value: selectedAns9,
                          txt: "Do you suffer from itching?"),
                      CustomDownDrop(
                          value: selectedAns10,
                          txt: "Do you have muscle stiffness?"),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            addInfo();
                          }
                        },
                        child: Text("Submit")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addInfo() {
    UserInfo info = UserInfo(
        age: ageController.text,
        gender: genderController.text,
        weight: weightController.text);
    FirebaseUtils.addUserInfoToFireStore(info).then((value) {
      Navigator.pushNamed(context, Question2.routeName);
    });
  }
}
