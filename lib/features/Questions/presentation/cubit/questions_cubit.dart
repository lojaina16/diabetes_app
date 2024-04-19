import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/core/cache_helper.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
  static QuestionsCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final List<String> debatesType = [
    "Type 1",
    "Type 2",
    "Pre-diabetes",
    "Other types",
    "I don’t have diabetes",
  ];
  int? debatesIndex;
  void selectType(int index) {
    emit(QuestionsInitial());
    debatesIndex = index;
    emit(QuestionsSelectType());
  }

  Future postType() async {
    emit(QuestionsPostTypeLoading());
    try {
      final type = debatesType[debatesIndex!];

      final id = const Uuid().v4();
      await firebaseFirestore
          .collection("users")
          .doc(UserData.uid)
          .collection("UserInfo")
          .doc(id)
          .set({"type": type, "uid": id});
      UserData.debatesType = type;
      CacheHelper.saveData(key: "debatesType", value: type);
      emit(QuestionsPostTypeSuccessfully(isHave: debatesIndex != 4));
    } on FirebaseException catch (error) {
      debugPrint(error.message.toString());
      emit(QuestionsPostTypeError());
    }
  }
}
