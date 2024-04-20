import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Questions/presentation/pages/insert_user_info.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShowResult extends StatelessWidget {
  final bool positive;
  const ShowResult({
    super.key,
    required this.positive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
              positive
                  ? "assets/lottie/warning.json"
                  : "assets/lottie/done2.json",
              width: context.width,
              fit: BoxFit.fill),
          Text(positive ? "Positive" : "Negative",
              style: TextStyle(
                  fontSize: 35,
                  color: positive ? const Color(0xffE50000) : AppColors.green,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.25),
            child: MyButton(
                text: "Next",
                radius: 16,
                onTap: () {
                  context.nextPageWitheRemove(UserInfoPage.route);
                }),
          )
        ],
      ),
    ),
    );
  }
}
