import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/features/Emergency/data/models/emergency_model.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'emergency_state.dart';

class EmergencyCubit extends Cubit<EmergencyState> {
  EmergencyCubit() : super(EmergencyInitial());
  static EmergencyCubit get(context) => BlocProvider.of(context);
  final TextEditingController controller = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final List<EmergencyModel> phones = [];
  Future getPhones() async {
    emit(EmergencyLoading());
    try {
      final coll = await firebaseFirestore
          .collection("users")
          .doc(UserData.uid)
          .collection("EmergencyCall")
          .get();
      if (coll.docs.isNotEmpty) {
        phones.clear();
        for (var element in coll.docs) {
          phones.add(EmergencyModel.fromJson(element.data()));
        }
      }
      controller.clear();

      emit(EmergencyGetPhoneSuccessfully());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(EmergencyGetPhoneError());
    }
  }

  Future add(String phone) async {
    emit(EmergencyLoading());
    final id = const Uuid().v4();
    try {
      final model = EmergencyModel(phone: phone, id: id);
      await firebaseFirestore
          .collection("users")
          .doc(UserData.uid)
          .collection("EmergencyCall")
          .doc(id)
          .set(model.toMap());
      phones.add(model);
      controller.clear();
      emit(EmergencyAddPhoneSuccessfully());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(EmergencyAddPhoneError());
    }
  }

  Future delete(String id) async {
    emit(EmergencyLoading());
    try {
      await firebaseFirestore
          .collection("users")
          .doc(UserData.uid)
          .collection("EmergencyCall")
          .doc(id)
          .delete();
      phones.removeWhere((element) => element.id == id);
      emit(EmergencyDeletePhoneSuccessfully());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(EmergencyDeletePhoneError());
    }
  }
}
