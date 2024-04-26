import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';

class FoodDetailsHeadRow extends StatelessWidget {
  const FoodDetailsHeadRow({
    super.key,
    required this.cubit,
    required this.repo,
  });

  final NutritionCubit cubit;
  final NutationsRepo repo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          FoodRowDetails(
            iconData: Icons.star,
            text: '${cubit.getRate(repo.totalRate, repo.rates.length * 5)}',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FoodRowDetails(
              iconData: Icons.timer,
              text: repo.time,
            ),
          ),
          FoodRowDetails(
            iconData: Icons.local_fire_department_sharp,
            text: "${repo.calories} kcl",
          ),
        ],
      ),
    );
  }
}

class FoodRowDetails extends StatelessWidget {
  final IconData iconData;
  final String text;
  const FoodRowDetails({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: !context.isDarkMode ? AppColors.black2 : Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text),
        ),
      ],
    );
  }
}
