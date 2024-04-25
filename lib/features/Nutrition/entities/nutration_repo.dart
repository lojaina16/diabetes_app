import 'package:diabetes/features/Nutrition/model/ingredients_model.dart';
import 'package:diabetes/features/Nutrition/model/nutrition_facts_model.dart';
import 'package:diabetes/features/Nutrition/model/rate_model.dart';
import 'package:equatable/equatable.dart';

class NutationsRepo extends Equatable {
  final String id;
  final String name;
  final String calories;
  final String image;
  final String time;
  final List<String> instructions;
  final List<IngredientsModel> ingredients;
  final List<NutritionFacts> nutritionFacts;
  final List<RateModel> rates;
  final int totalRate;

  const NutationsRepo(
      {required this.id,
      required this.name,
      required this.image,
      required this.time,
      required this.calories,
      required this.instructions,
      required this.ingredients,
      required this.nutritionFacts,
      required this.rates,
      required this.totalRate});

  @override
  List<Object> get props => [
        id,
        name,
        image,
        time,
        calories,
        instructions,
        ingredients,
        nutritionFacts,
        rates,
        totalRate,
      ];
}
