import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/app_string.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/pages/insert_user_info.dart';
import 'package:diabetes/features/Questions/presentation/widgets/quz_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetectDiabetes extends StatelessWidget {
  static const route = "DetectDiabetes/";
  const DetectDiabetes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Diabetes Detection",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          final cubit = QuestionsCubit.get(context);
          return Loading(
            loading: state is QuestionsPostTypeLoading,
            child: ListView(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              primary: true,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppString.questions.length,
                  itemBuilder: (context, index) {
                    final item = AppString.questions[index];
                    return QuzItem(
                      item: item,
                      cubit: cubit,
                      index: index,
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.18),
                  child: MyButton(
                    text: "Detect",
                    onTap: () {
                      if (cubit.questionsMap.length == 6) {
                        context.nextPage(UserInfoPage.route);
                      } else {
                        context.showSnack("Please Answers All Questions First ",
                            isError: true);
                      }
                    },
                    radius: 16,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
