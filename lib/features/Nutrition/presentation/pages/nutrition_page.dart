import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NutritionPage extends StatelessWidget {
  static const String route = "NutritionPage/";
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<NutritionCubit, NutritionState>(
        builder: (context, state) {
          final cubit = NutritionCubit.get(context);
          final food = cubit.nutations;
          return Loading(
            loading: state is NutritionGetFoodLoading,
            child: ListView.builder(
              itemCount: food.length,
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              primary: true,
              itemBuilder: (context, index) {
                final item = food[index];
                return FoodItem(item: item);
              },
            ),
          );
        },
      ),
    );
  }
}

