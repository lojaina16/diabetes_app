import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/app_string.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/pages/detect_diabetes.dart';
import 'package:diabetes/features/Questions/presentation/pages/show_result.dart';
import 'package:diabetes/features/Questions/presentation/widgets/diabetes_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Questions extends StatelessWidget {
  static const route = "Questions/";
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                        child: Text(
                      "What type of diabetes do you have ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Center(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemBuilder: (context, index) {
                        final text = AppString.debatesType[index];
                        return DiabetesItem(
                          cubit: cubit,
                          text: text,
                          index: index,
                        );
                      },
                      itemCount: AppString.debatesType.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.08,
                  ),
                  MyButton(
                    text: "Next",
                    textColor: cubit.debatesIndex != null
                        ? Colors.white
                        : Colors.black,
                    onTap: () async {
                      if (cubit.debatesIndex != null) {
                        if (cubit.debatesIndex == 3) {
                          context.nextPage(DetectDiabetes.route);
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShowResult(
                              positive: cubit.debatesIndex != 4,
                            ),
                          ));
                        }
                      } else {
                        context.showSnack("please Select Type First ",
                            isError: true);
                      }
                    },
                    buttonColor: cubit.debatesIndex != null
                        ? AppColors.primary
                        : Colors.grey.shade300,
                    radius: 16,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
