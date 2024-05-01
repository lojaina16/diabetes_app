import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/my_image.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/pages/nutrition_detalis_page.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.item,
  });

  final NutationsRepo item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    item.mealTime,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ))),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NutritionDetails(
                  repo: item,
                ),
              ));
            },
            child: SizedBox(
              width: context.width * 0.86,
              child: Card(
                color: Theme.of(context).cardColor,
                surfaceTintColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyNetworkImage(
                        image: item.image,
                        height: context.height * 0.1,
                        width: context.width * 0.2,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: context.width * 0.57),
                            child: Text(
                              item.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(Icons.timer, color: AppColors.grey),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                item.time,
                                style: TextStyle(
                                    color: AppColors.grey, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}
