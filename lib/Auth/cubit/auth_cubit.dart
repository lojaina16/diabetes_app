import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/Auth/cubit/auth_state.dart';
import 'package:diabetes/core/cache_helper.dart';
import 'package:diabetes/model/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController mobileNumberController = TextEditingController();

  final formKeyLogin = GlobalKey<FormState>();
  final formKeySingUp = GlobalKey<FormState>();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future login() async {
    emit(AuthLoginLoading());
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user.user != null) {
        saveUserData(user);
        emit(AuthLoginSuccessfully());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthLoginError(error: e.message ?? ""));
    }
  }

  void saveUserData(UserCredential user) {
    final uid = user.user?.uid;
    UserData.uid = uid;
    CacheHelper.saveData(key: "uid", value: uid);
  }

  //? Sing in With Google
  Future<void> googleSingUp() async {
    emit(AuthSingUpLoading());
    try {
      GoogleSignIn googleUser = GoogleSignIn();

      if (await googleUser.isSignedIn()) {
        googleUser.currentUser?.clearAuthCache();
        googleUser.signOut();
      }
      final user = await googleUser.signIn();
      if (user != null) {
        final GoogleSignInAuthentication googleAuth = await user.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        saveUserData(userCredential);
        emit(AuthSingUpSuccessfully());
      }
    } catch (error) {
      debugPrint(error.toString());

      emit(AuthSingUpError(error: error.toString()));
    }
  }

  //! Sing in With Google End

  Future register() async {
    emit(AuthSingUpLoading());
    try{
      final user = await firebaseAuth.
    } on FirebaseAuthException catch (e){
      emit(Auth);
    }
  }
}
brbrbbb