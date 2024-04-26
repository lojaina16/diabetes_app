import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:diabetes/features/Nutrition/presentation/pages/rate_page.dart';
import 'package:diabetes/model/user_data.dart';
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
        for (var element in repo.rates) {
          if (element.userId == UserData.uid) {
            cubit.selectStar(int.parse(element.rate), id: repo.id);
          }
        }
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
