import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Auth/widgets/custom_text_field.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/pages/show_result.dart';
import 'package:diabetes/features/Questions/presentation/widgets/drop_dawn.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoPage extends StatelessWidget {
  static const String route = "UserInfoPage/";
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "User Info",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          final cubit = QuestionsCubit.get(context);
          return Loading(
            loading: state is QuestionsPostTypeLoading ||
                state is QuestionsDetectLoading,
            child: Form(
              key: cubit.formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                primary: true,
                children: [
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  AuthTextForm(
                    controller: cubit.age,
                    icon: Icons.calendar_today_rounded,
                    textInputType: TextInputType.number,
                    hintText: "Enter Your Age",
                  ),
                  AuthTextForm(
                    controller: cubit.a1cTest,
                    icon: Icons.text_format,
                    textInputType: TextInputType.number,
                    hintText: "Enter Your a1cTest",
                  ),
                  AuthTextForm(
                    controller: cubit.bloodGlucoseLevel,
                    icon: Icons.leaderboard,
                    textInputType: TextInputType.number,
                    hintText: "Enter Your bloodGlucoseLevel",
                  ),
                  DropdownAddress(
                    items: const [
                      "Yes",
                      'No',
                    ],
                    hint: "Do you have a heart disease?",
                    changeHint: cubit.heartDisease,
                    onChanged: (value) {
                      cubit.selectHeartDisease(value);
                    },
                  ),
                  DropdownAddress(
                    items: cubit.smokingAnswer,
                    hint: "Smoking History",
                    changeHint: cubit.smoking,
                    onChanged: (value) {
                      cubit.selectSmoking(value);
                    },
                  ),
                  DropdownAddress(
                    items: const [
                      "Yes",
                      'No',
                    ],
                    hint: "Do you have hypertension?",
                    changeHint: cubit.hypertension,
                    onChanged: (value) {
                      cubit.selectHypertension(value);
                    },
                  ),
                  AuthTextForm(
                    controller: cubit.weight,
                    icon: Icons.line_weight,
                    textInputType: TextInputType.number,
                    hintText: "Enter Your weight",
                  ),
                  AuthTextForm(
                    controller: cubit.bmi,
                    icon: Icons.calculate,
                    textInputType: TextInputType.number,
                    hintText: "Enter Your bmi",
                    textInputAction: TextInputAction.done,
                  ),
                  DropdownAddress(
                    items: const [
                      "Male",
                      'Female',
                    ],
                    hint: "Gender",
                    changeHint: cubit.gender,
                    onChanged: (value) {
                      cubit.selectGender(value);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyButton(
                      text: "Finish",
                      onTap: (() {
                        if (cubit.formKey.currentState?.validate() ?? false) {
                          if (cubit.debatesIndex == 3) {
                            cubit.detect();
                          } else {
                            cubit.saveUserInfo();
                          }
                        }
                      }))
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, QuestionsState state) {
          if (state is QuestionsPostTypeSuccessfully) {
              HomeCubit.get(context).getUserData();
            context.nextPageWitheRemove(HomeScreen.routeName);
          } else if (state is QuestionsDetectSuccessfully) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ShowResult(positive: state.isDiabetes),
                ),
                (route) => false);
          } else if (state is QuestionsDetectError) {
            context.showSnack(state.error.toString());
          }
        },
      ),
    );
  }
}
