part of 'nutrition_cubit.dart';

abstract class NutritionState extends Equatable {
  const NutritionState();

  @override
  List<Object> get props => [];
}

class NutritionInitial extends NutritionState {}

class NutritionChangeNutrition extends NutritionState {}

class NutritionChangeIngredient extends NutritionState{}


class NutritionGetFoodLoading extends NutritionState {}
class NutritionGetFoodSuccessfully extends NutritionState {}
class NutritionGetFoodError extends NutritionState {}

class NutritionSelectStart extends NutritionState {}

class NutritionRateRecipeLoading extends NutritionState {}
class NutritionRateRecipeSuccessfully extends NutritionState {}
class NutritionRateRecipeError extends NutritionState {}
