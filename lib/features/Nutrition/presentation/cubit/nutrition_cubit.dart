import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/model/nutations_model.dart';
import 'package:diabetes/model/user_data.dart';
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
          debugPrint('element: $element');
          final NutationsRepo recipe = NutationsModel.fromJson(element.data());
          debugPrint('recipe: $recipe');
          nutations.add(recipe);
          for (var element in recipe.rates) {
            if (element.userId == UserData.uid) {
              allRates[recipe.id] = int.parse(element.rate);
            }
          }
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

  int rate = 0;
  void selectStar(
    int star,
  ) {
    emit(NutritionInitial());
    rate = star;

    emit(NutritionSelectStart());
  }

  String get rateName {
    switch (rate) {
      case 5:
        return 'Awesome';
      case 4:
        return 'Good';
      case 3:
        return 'popular';
      case 2:
        return 'weak';
      default:
        return 'Bad';
    }
  }

  final Map<String, int> allRates = {};

  Future rateRecipe(String id) async {
    emit(NutritionRateRecipeLoading());
    try {
      await deleteRate(id);
      await firebaseFirestore.collection('food').doc(id).update({
        "TotalRate": FieldValue.increment(rate),
        "rates": FieldValue.arrayUnion([
          {"rate": rate.toString(), "userId": UserData.uid}
        ])
      });
      allRates[id] = rate;

      emit(NutritionRateRecipeSuccessfully());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
      emit(NutritionRateRecipeError());
    }
  }

  Future deleteRate(String id) async {
    final bool check = allRates.containsKey(id);
    if (check) {
      final myRate = allRates[id];
      await firebaseFirestore.collection('food').doc(id).update({
        "TotalRate": FieldValue.increment(-myRate!),
        "rates": FieldValue.arrayRemove([
          {"rate": myRate.toString(), "userId": UserData.uid}
        ])
      });
    }
  }
}
