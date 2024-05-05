import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/core/api/dio_helper.dart';
import 'package:diabetes/core/api/end_points.dart';
import 'package:diabetes/core/cache_helper.dart';
import 'package:diabetes/core/utils/app_string.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:diabetes/model/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
  static QuestionsCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final dio = DioHelper();
  final TextEditingController age = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController a1cTest = TextEditingController();
  final TextEditingController bloodGlucoseLevel = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> smokingAnswer = ["Never", "Former", "Current"];
  String? smoking;
  void selectSmoking(String? value) {
    emit(QuestionsInitial());
    smoking = value;
    emit(QuestionsSelectGender());
  }

  int? debatesIndex;
  void selectType(int? index) {
    emit(QuestionsInitial());
    debatesIndex = index;
    emit(QuestionsSelectType());
  }

  String? hypertension;
  void selectHypertension(String? value) {
    emit(QuestionsInitial());
    hypertension = value;
    emit(QuestionsSelectGender());
  }

  String? heartDisease;
  void selectHeartDisease(String? value) {
    emit(QuestionsInitial());
    heartDisease = value;
    emit(QuestionsSelectGender());
  }

  String? gender;
  void selectGender(String? value) {
    emit(QuestionsInitial());
    gender = value;
    emit(QuestionsSelectGender());
  }

  Future saveUserInfo() async {
    emit(QuestionsPostTypeLoading());
    try {
      final type = AppString.debatesType[debatesIndex!];

      await saveData(type);
      emit(const QuestionsPostTypeSuccessfully());
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error.message.toString());
      }
      emit(QuestionsPostTypeError());
    }
  }

  String? bmi;
  void clear() {
    age.clear();
    weight.clear();
    bmi = null;
    height.clear();
    a1cTest.clear();
    bloodGlucoseLevel.clear();
    smoking = null;
    debatesIndex = null;
    hypertension = null;
    heartDisease = null;
    gender = null;
  }

  Future saveData(String type) async {
    final id = const Uuid().v4();
    final MyUserInfo userInfo = MyUserInfo(
        age: age.text,
        gender: gender.toString(),
        id: id,
        weight: weight.text,
        hypertension: hypertension.toString().contains("Yes"),
        smokingHistory: smoking.toString(),
        bmi: bmi.toString(),
        type: type,
        a1cTest: a1cTest.text,
        bloodGlucoseLevel: bloodGlucoseLevel.text,
        heartDisease: heartDisease.toString().contains("Yes"));
    await firebaseFirestore
        .collection("users")
        .doc(UserData.uid)
        .collection("UserInfo")
        .doc(id)
        .set(userInfo.toFireStore());
    UserData.debatesType = type;
    CacheHelper.saveData(key: "debatesType", value: type);
    clear();
  }

  Future detect() async {
    emit(QuestionsDetectLoading());
    final body = {
      "gender": gender.toString().contains('F') ? 0 : 1,
      "age": int.parse(age.text),
      "hypertension": hypertension.toString().contains("Yes") ? 1 : 0,
      "heart_disease": heartDisease.toString().contains("Yes") ? 1 : 0,
      "smoking_history":
          smokingAnswer.indexWhere((element) => element == smoking) + 1,
      "bmi": double.parse(bmi.toString()),
      "HbA1c_level": double.parse(a1cTest.text),
      "blood_glucose_level": int.parse(bloodGlucoseLevel.text)
    };

    final response = await dio.post(EndPoints.detectAiModelUrl, body);
    emit(response.fold(
      (l) => QuestionsDetectError(l),
      (r) {
        final bool isDiabetes = r['diabetes_prediction'] == 1;
        saveData(isDiabetes ? 'Type 1' : "I don’t have diabetes");
        return QuestionsDetectSuccessfully(isDiabetes);
      },
    ));
  }
  void calcBmi() {
    emit(QuestionsInitial());
    if (height.text.isNotEmpty&&weight.text.isNotEmpty) {
      bmi = (double.parse(weight.text) /
          (double.parse(height.text) * double.parse(height.text)) *
          10000)
          .toStringAsFixed(2);
      
    }
    emit(QuestionsCalcBmi());
  }
}
