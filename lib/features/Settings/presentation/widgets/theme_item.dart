import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';

class ThemeItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  const ThemeItem({
    super.key,
    required this.cubit,
    required this.iconData,
    required this.text,
  });

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.selectTheme(text, context.brightness == Brightness.dark);
      },
      child: Container(
        decoration: BoxDecoration(
          color: cubit.theme.contains(text) ? AppColors.selected : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(
              iconData,
              color:
                  cubit.theme.contains(text) ? AppColors.primary : Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text,
                style: TextStyle(color: AppColors.primary, fontSize: 16),
              ),
            ),
            const Spacer(),
            if (cubit.theme.contains(text))
              Icon(
                Icons.check,
                size: 15,
                color: AppColors.green,
              ),
          ],
        ),
      ),
    );
  }
}
