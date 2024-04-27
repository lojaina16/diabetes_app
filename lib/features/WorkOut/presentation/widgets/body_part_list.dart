import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/features/WorkOut/presentation/cubit/workout_cubit.dart';
import 'package:diabetes/features/WorkOut/presentation/widgets/body_item.dart';
import 'package:flutter/material.dart';

class BodyBartList extends StatelessWidget {
  const BodyBartList({
    super.key,
    required this.cubit,
  });

  final WorkoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.074,
      child: ListView.builder(
        itemCount: cubit.bodyPart.length,
        padding:
            EdgeInsets.symmetric(vertical: context.height * 0.01),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final String bodyPart = cubit.bodyPart[index];
    
          return Row(
            children: [
              if (index == 0)
                BodyBartItem(cubit: cubit, bodyPart: null),
              BodyBartItem(cubit: cubit, bodyPart: bodyPart),
            ],
          );
        },
      ),
    );
  }
}
