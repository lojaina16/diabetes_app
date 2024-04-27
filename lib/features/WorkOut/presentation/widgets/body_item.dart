import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/WorkOut/presentation/cubit/workout_cubit.dart';
import 'package:flutter/material.dart';

class BodyBartItem extends StatelessWidget {
  const BodyBartItem({
    super.key,
    required this.cubit,
    required this.bodyPart,
  });

  final WorkoutCubit cubit;
  final String? bodyPart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cubit.getExercises(body: bodyPart);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: cubit.selectBody == bodyPart
                    ? AppColors.primary
                    : AppColors.white3)),
        child: Text(
          bodyPart ?? ' All ',
          style: TextStyle(
              color: cubit.selectBody == bodyPart ? AppColors.primary : null),
        ),
      ),
    );
  }
}
