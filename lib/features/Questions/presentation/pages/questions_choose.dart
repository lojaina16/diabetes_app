import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/pages/detect_diabetes.dart';
import 'package:diabetes/features/Questions/presentation/pages/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class QuestionsChoses extends StatelessWidget {
  static const String route = "QuestionsChoses/";
  const QuestionsChoses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          final cubit = QuestionsCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do You have diabetes ? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                LottieBuilder.asset('assets/lottie/question.json'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'Yes',
                      onTap: () {
                        context.nextPage(Questions.route);
                      },
                      width: 0.4,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    MyButton(
                      text: 'i Don\'t know',
                      onTap: () {
                        cubit.selectType(3);

                        context.nextPage(DetectDiabetes.route);
                      },
                      width: 0.4,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
