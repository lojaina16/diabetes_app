import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';

class NutritionList extends StatelessWidget {
  const NutritionList({
    super.key,
    required this.cubit,
    required this.repo,
  });

  final NutritionCubit cubit;
  final NutationsRepo repo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.changeNutritionMethod();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Nutrition Value (perSaving)',
                    style: TextStyle(color: AppColors.black2),
                  ),
                  const Spacer(),
                  Icon(
                    cubit.changeNutrition
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: AppColors.blue,
                  ),
                ],
              ),
              if (cubit.changeNutrition)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: AppColors.grey,
                  ),
                ),
              if (cubit.changeNutrition)
                ListView.separated(
                  padding: const EdgeInsets.all(0),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: AppColors.grey,
                    ),
                  ),
                  itemCount: repo.nutritionFacts.length,
                  addRepaintBoundaries: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = repo.nutritionFacts[index];
                    return Row(
                      children: [
                        Text(item.nutrition),
                        const Spacer(),
                        Text(item.value)
                      ],
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
