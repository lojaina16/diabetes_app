import 'package:cached_network_image/cached_network_image.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Nutrition/entities/nutration_repo.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({
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
        cubit.changeIngredientMethod();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(
                        color: !context.isDarkMode
                            ? AppColors.black2
                            : Colors.white),
                  ),
                  const Spacer(),
                  Icon(
                    cubit.changeIngredient
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: AppColors.blue,
                  ),
                ],
              ),
              if (cubit.changeIngredient)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: AppColors.grey,
                  ),
                ),
              if (cubit.changeIngredient)
                ListView.separated(
                  padding: const EdgeInsets.all(0),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: AppColors.grey,
                    ),
                  ),
                  itemCount: repo.ingredients.length,
                  addRepaintBoundaries: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = repo.ingredients[index];
                    return Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: item.image,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 20,
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: context.width * 0.62),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name),
                              Text(
                                '${item.ingredients}(${item.quantities})',
                                style: TextStyle(
                                    color: AppColors.grey, fontSize: 16),
                              )
                            ],
                          ),
                        )
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
