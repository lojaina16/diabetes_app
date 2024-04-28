import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Settings/presentation/cubit/settings_cubit.dart';
import 'package:diabetes/features/Settings/presentation/widgets/theme_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeSettings extends StatelessWidget {
  static const String route = "Theme/";
  const ThemeModeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Theme",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = SettingsCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ThemeItem(
                  cubit: cubit,
                  iconData: Icons.light_mode,
                  text: "light",
                ),
                ThemeItem(
                  cubit: cubit,
                  iconData: Icons.dark_mode,
                  text: "Dark",
                ),
                const Spacer(),
                MyButton(
                  text: "Save",
                  onTap: () {
                    cubit.selectThemeDone();
                    context.pop;
                    context.showSnack("Theme Save Successfully");
                  },
                  radius: 16,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
