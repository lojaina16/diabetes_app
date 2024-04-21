import 'package:cloud_firestore/cloud_firestore.dart';
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
  final TextEditingController age = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController bmi = TextEditingController();
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
  void selectType(int index) {
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
      final id = const Uuid().v4();
      final MyUserInfo userInfo = MyUserInfo(
          age: age.text,
          gender: gender.toString(),
          id: id,
          weight: weight.text,
          hypertension: hypertension.toString().contains("Yes"),
          smokingHistory: smoking.toString(),
          bmi: bmi.text,
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
      emit(const QuestionsPostTypeSuccessfully());
    } on FirebaseException catch (error) {
      debugPrint(error.message.toString());
      emit(QuestionsPostTypeError());
    }
  }

  final Map<String, bool> questionsMap = {};
  void answerQuestions(String que, bool answer) {
    emit(QuestionsInitial());
    questionsMap[que] = answer;
    emit(QuestionsAnswersTOqUESTIONS());
  }
}
