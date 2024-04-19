import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';

class DiabetesItem extends StatelessWidget {
  const DiabetesItem(
      {super.key,
      required this.cubit,
      required this.text,
      required this.index});

  final QuestionsCubit cubit;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.selectType(index);
      },
      child: Center(
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 560),
              width: context.width,
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 25),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: cubit.debatesIndex == index
                      ? AppColors.primary
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    color: cubit.debatesIndex == index
                        ? Colors.white
                        : Colors.black),
              ))),
    );
  }
}
