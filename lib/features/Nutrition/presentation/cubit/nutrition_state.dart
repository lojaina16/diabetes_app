part of 'nutrition_cubit.dart';

abstract class NutritionState extends Equatable {
  const NutritionState();

  @override
  List<Object> get props => [];
}

class NutritionInitial extends NutritionState {}

class NutritionGetFoodLoading extends NutritionState {}
class NutritionChangeNutrition extends NutritionState {}

class NutritionChangeIngredient extends NutritionState{}


class NutritionGetFoodSuccessfully extends NutritionState {}
class NutritionGetFoodError extends NutritionState {}

