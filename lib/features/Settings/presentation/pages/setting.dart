import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Settings/presentation/pages/theme.dart';
import 'package:diabetes/features/Settings/presentation/widgets/profile_widget.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/cubit/home_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  static const String route = "SettingPage/";
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          final user = cubit.userModel;
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: context.height * 0.07,
              ),
              ShowProfileWidget(user: user),
              SizedBox(
                height: context.height * 0.07,
              ),
              GestureDetector(
                onTap: () {
                  context.nextPage(ThemeModeSettings.route);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.color_lens,
                        color: AppColors.primary,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Theme",
                          style:
                              TextStyle(color: AppColors.primary, fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
