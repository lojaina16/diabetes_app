import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:diabetes/features/Nutrition/presentation/pages/rate_page.dart';
import 'package:flutter/material.dart';

class RateCard extends StatelessWidget {
  final NutationsRepo repo;
  final NutritionCubit cubit;
  const RateCard({
    super.key,
    required this.repo,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.selectStar(cubit.allRates[repo.id] ?? 0);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RatePage(
            repo: repo,
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Card(
          color: Theme.of(context).cardColor,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Rate this Recipe',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_right,
                  color: AppColors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
