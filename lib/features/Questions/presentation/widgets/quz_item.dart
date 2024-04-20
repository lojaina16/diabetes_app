import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/app_string.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/widgets/quz_answers.dart';
import 'package:flutter/material.dart';

class QuzItem extends StatelessWidget {
  const QuzItem({
    super.key,
    required this.item,
    required this.cubit,
    required this.index,
  });

  final String item;
  final QuestionsCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                item,
                style:
                    TextStyle(color: context.theme.textTheme.bodyMedium?.color),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuestionsAnswers(
                  color: AppColors.green,
                  text: "Yes",
                  cubit: cubit,
                  quiz: AppString.questions[index],
                ),
                const SizedBox(
                  width: 32,
                ),
                QuestionsAnswers(
                  color: AppColors.error,
                  text: "No",
                  cubit: cubit,
                  quiz: AppString.questions[index],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
