import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Nutrition/presentation/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';

class RateStarsList extends StatelessWidget {
  const RateStarsList({
    super.key,
    required this.cubit,
  });

  final NutritionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.height * 0.07,
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onDoubleTap: () {
                if (index == 0) {
                  cubit.selectStar(0);
                }
              },
              onTap: () {
                cubit.selectStar(index + 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 550),
                    crossFadeState: cubit.rate > index
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Icon(
                      Icons.star_outline_sharp,
                      size: 40,
                      color: AppColors.grey,
                    ),
                    secondChild: const Icon(
                      Icons.star,
                      size: 40,
                      color: Colors.orange,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
