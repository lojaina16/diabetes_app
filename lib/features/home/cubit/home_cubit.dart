import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/core/cache_helper.dart';
import 'package:diabetes/features/home/cubit/home_cubit_state.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:diabetes/model/user_info.dart';
import 'package:diabetes/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserModel? userModel;
  MyUserInfo? userInfo;
  Future getUserData() async {
    emit(HomeGetUserDataLoading());
    try {
      final data =
          await firebaseFirestore.collection("users").doc(UserData.uid).get();
      if (data.exists) {
        final info = await data.reference.collection("UserInfo").get();
        final isFound = info.docs.first.exists;

        if (isFound) {
          userInfo = MyUserInfo.fromFireStore(info.docs.first.data());
          UserData.debatesType = userInfo?.type;
          CacheHelper.saveData(key: "debatesType", value: userInfo?.type);
        }

        userModel = UserModel.fromJson(data.data()!);

        emit(HomeGetUserDataSuccessfully());
      } else {
        emit(HomeGetUserDataError());
      }
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      emit(HomeGetUserDataError());
    }
  }

  Future logOut() async {
    emit(HomeSingOutLoading());
    try {
      await firebaseAuth.signOut();
      await UserData.clearUserData();
      userModel = null;
      userInfo = null;
      emit(HomeSingOutSuccessfully());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      emit(HomeSingOutError());
    }
  }
}
