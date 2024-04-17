import 'package:diabetes_app/model/user_info.dart';
import 'package:diabetes_app/questionScreens/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebase_utils.dart';
import 'custom_textfield.dart';

class Question extends StatefulWidget {
  static const String routeName = "questionScreen";

  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<String> gender = ["Male", "Female", "Other"];
  List<String> answer = ["Yes", "No"];
  List<String> smokingAnswer = ["Never", "Former", "Current"];
  String? selectedGender;
  String? selectedAns1;
  String? selectedAns2;
  String? selectedAns3;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var weightController = TextEditingController();
  var hypertensionController = TextEditingController();
  var heartDiseaseController = TextEditingController();
  var smokingHistoryController = TextEditingController();
  var bmiController = TextEditingController();
  var a1cTestController = TextEditingController();
  var bloodGlucoseLevelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text("Diabetes",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24, color: const Color(0xff5063BF))),
                  Text("Detection",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24, color: const Color(0xff5063BF))),
                  const SizedBox(height: 20),
                  CustomTextField(
                      labelText: "Enter Your Age",
                      type: TextInputType.number,
                      controller: ageController),
                  CustomTextField(
                      labelText: "Enter Your Weight",
                      type: TextInputType.number,
                      controller: weightController),
                  CustomTextField(
                      labelText: "Enter Your BMI",
                      type: TextInputType.number,
                      controller: bmiController),
                  CustomTextField(
                      labelText: "Enter Your result of A1C Test",
                      type: TextInputType.number,
                      controller: a1cTestController),
                  CustomTextField(
                      labelText: "Enter Your Blood Glucose Level",
                      type: TextInputType.number,
                      controller: bloodGlucoseLevelController),
                  const CustomContainer(txt: "Choose your gender"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      addRadioButton(0, 'Male'),
                      addRadioButton(1, 'Female'),
                      addRadioButton(2, 'Other'),
                    ],
                  ),
                  Column(
                    children: [
                      const CustomContainer(txt: "what is your Smoking History?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          addRadioButton4(0, 'Never'),
                          addRadioButton4(1, 'Former'),
                          addRadioButton4(2, 'Current')
                        ],
                      ),
                      const CustomContainer(txt: "Do you have hypertension?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          addRadioButton2(0, 'Yes'),
                          addRadioButton2(1, 'No'),
                        ],
                      ),
                      const CustomContainer(txt: "Do you have a heart disease?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          addRadioButton3(0, 'Yes'),
                          addRadioButton3(1, 'No'),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5063BF)),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            if (a1cTestController.text == "5.7") {
                              //Navigator.pushNamed(context, OutputScreen2.routeName);
                              addInfo();
                            } else if (a1cTestController.text == "6.5") {
                              //Navigator.pushNamed(context, OutputScreen1.routeName);
                              addInfo();
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Detect"),
                        )),
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
      weight: weightController.text,
      hypertension: hypertensionController.text,
      heartDisease: heartDiseaseController.text,
      bloodGlucoseLevel: bloodGlucoseLevelController.text,
      smokingHistory: smokingHistoryController.text,
      a1cTest: a1cTestController.text,
      bmi: bmiController.text,
    );
    FirebaseUtils.addUserInfoToFireStore(info).then((value) {
      //Navigator.pushNamed(context, Question2.routeName);
    });
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.blue,
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
              genderController.text = value!;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Row addRadioButton2(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: selectedAns1 == "Yes" ? Colors.blue : Colors.red,
          value: answer[btnValue],
          groupValue: selectedAns1,
          onChanged: (value) {
            setState(() {
              selectedAns1 = value;
              hypertensionController.text = value!;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Row addRadioButton3(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: selectedAns2 == "Yes" ? Colors.blue : Colors.red,
          value: answer[btnValue],
          groupValue: selectedAns2,
          onChanged: (value) {
            setState(() {
              selectedAns2 = value;
              heartDiseaseController.text = value!;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Row addRadioButton4(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.blue,
          value: smokingAnswer[btnValue],
          groupValue: selectedAns3,
          onChanged: (value) {
            setState(() {
              selectedAns3 = value;
              smokingHistoryController.text = value!;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
