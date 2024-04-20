import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Auth/widgets/custom_text_field.dart';
import 'package:diabetes/features/Questions/presentation/cubit/questions_cubit.dart';
import 'package:diabetes/features/Questions/presentation/widgets/drop_dawn.dart';
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
        title: const Text("User Info"),
      ),
      body: BlocConsumer<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          final cubit = QuestionsCubit.get(context);
          return Loading(
            loading: state is QuestionsPostTypeLoading,
            child: Form(
              key: cubit.formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                primary: true,
                children: [
                  SizedBox(
                    height: context.height * 0.05,
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
                  AuthTextForm(
                    controller: cubit.heartDisease,
                    icon: Icons.heart_broken_rounded,
                    textInputType: TextInputType.text,
                    hintText: "Enter Your heartDisease",
                  ),
                  AuthTextForm(
                    controller: cubit.smokingHistory,
                    icon: Icons.smoking_rooms,
                    textInputType: TextInputType.text,
                    hintText: "Enter Your smokingHistory",
                  ),
                  AuthTextForm(
                    controller: cubit.hypertension,
                    icon: Icons.fact_check_sharp,
                    textInputType: TextInputType.number,
                    hintText: "Enter Your hypertension",
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: DropdownAddress(
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyButton(
                      text: "Finish",
                      onTap: (() {
                        if (cubit.formKey.currentState?.validate() ?? false) {
                          cubit.saveUserInfo();
                        }
                      }))
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, QuestionsState state) {
          if (state is QuestionsPostTypeSuccessfully) {
            context.nextPageWitheRemove(HomeScreen.routeName);
          }
        },
      ),
    );
  }
}
