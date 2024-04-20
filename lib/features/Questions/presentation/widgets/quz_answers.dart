import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';

class QuestionsAnswers extends StatelessWidget {
  final String text;
  final QuestionsCubit cubit;
  final String quiz;
  final Color color;
  const QuestionsAnswers({
    super.key,
    required this.text,
    required this.color,
    required this.cubit,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    final isYes = text == "Yes";
    final isSelect = cubit.questionsMap[quiz] == isYes;
    return InkWell(
      onTap: () {
        cubit.answerQuestions(quiz, text == "Yes");
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 650),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isSelect
                ? isYes
                    ? AppColors.green
                    : AppColors.error
                : null,
            shape: BoxShape.circle,
            border: Border.all(color: color)),
        child: Text(
          text,
          style: TextStyle(
              color: isSelect
                  ? Colors.white
                  : context.theme.textTheme.bodyMedium?.color),
        ),
      ),
    );
  }
}
