import 'package:diabetes/Auth/cubit/auth_cubit.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/assets_manager.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(context.width, context.height * 0.06),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide.none),
              backgroundColor: AppColors.google),
          onPressed: () {
            cubit.googleSingUp();
          },
          icon: SvgPicture.asset(
            AppAssets.google,
            height: context.height * 0.04,
          ),
          label: const Text(
            "Sing Up withe Google",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
