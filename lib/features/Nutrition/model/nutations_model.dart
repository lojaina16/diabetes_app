import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/model/ingredients_model.dart';
import 'package:diabetes/features/Nutrition/model/nutrition_facts_model.dart';
import 'package:diabetes/features/Nutrition/model/rate_model.dart';

class NutationsModel extends NutationsRepo {
  const NutationsModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.time,
      required super.instructions,
      required super.ingredients,
      required super.nutritionFacts,
      required super.rates,
      required super.totalRate, required super.calories});
  factory NutationsModel.fromJson(Map<String, dynamic> json) {
    List<IngredientsModel> getIngredients() {
      final List<IngredientsModel> list = [];
      final jsonList = json['Ingredients'] as List;
      for (var element in jsonList) {
        list.add(IngredientsModel.fromJson(element));
      }

      return list;
    }

    List<NutritionFacts> getNutritionFacts() {
      final List<NutritionFacts> list = [];
      final jsonList = json['NutritionFacts'] as List;
      for (var element in jsonList) {
        list.add(NutritionFacts.fromJson(element));
      }

      return list;
    }

    List<RateModel> getRates() {
      final List<RateModel> list = [];
      final jsonList = json['rates'] as List;
      for (var element in jsonList) {
        list.add(RateModel.fromJson(element));
      }

      return list;
    }

    return NutationsModel(
      id: json['id'],
      name: json['name'],
      calories: json['Calories'],
      image: json['image'],
      time: json['time'],
      instructions: json['Instructions'].cast<String>(),
      ingredients: getIngredients(),
      nutritionFacts: getNutritionFacts(),
      rates: getRates(),
      totalRate: json['TotalRate'],
    );
  }
}
