import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/model/nutations_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  NutritionCubit() : super(NutritionInitial());
  static NutritionCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final List<NutationsRepo> nutations = [];

  Future getFood() async {
    emit(NutritionGetFoodLoading());
    try {
      final collection = await firebaseFirestore.collection('food').get();

      if (collection.docs.isNotEmpty) {
        for (var element in collection.docs) {
          nutations.add(NutationsModel.fromJson(element.data()));
        }
      }
      emit(NutritionGetFoodSuccessfully());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(NutritionGetFoodError());
    }
  }

  double getRate(int total, int totalUserRate) {
    double rate = 0.0;
    rate = (total / totalUserRate) * 5;
    return rate;
  }

  //? handle
  bool changeNutrition = false;
  void changeNutritionMethod() {
    emit(NutritionInitial());
    changeNutrition = !changeNutrition;
    emit(NutritionChangeNutrition());
  }

  bool changeIngredient = false;
  void changeIngredientMethod() {
    emit(NutritionInitial());
    changeIngredient = !changeIngredient;
    emit(NutritionChangeIngredient());
  }
}
