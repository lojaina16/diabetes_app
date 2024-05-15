import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/snack_bar_on_context.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Settings/presentation/pages/setting.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/pages/about.dart';
import 'package:diabetes/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.user,
    required this.cubit,
  });
  final HomeCubit cubit;

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: context.width * 0.7,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(cubit.userInfo?.gender != null
                      ? cubit.userInfo!.gender.contains('F')
                          ? "assets/images/girl.png"
                          : "assets/images/boy.png"
                      : "")),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${user?.name}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${user?.email}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pop;
                  context.nextPage(SettingPage.route);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Color(0xff7588E4),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Settings",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  context.pop;
                  final link = Uri.parse(
                      'https://docs.google.com/document/d/1A76Qviw_m_mv8xi1AH8gMB1vSpQltk40YeM8K93EO8U/edit?usp=sharing');
                  if (await canLaunchUrl(link)) {
                    await launchUrl(link);
                  } else {
                    // ignore: use_build_context_synchronously
                    context.showSnack('Could not launch $link', isError: true);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.privacy_tip,
                        color: Color(0xff7588E4),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Privacy Policy",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.pop;
                  context.nextPage(About.route);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.info,
                      color: Color(0xff7588E4),
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("About App",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Spacer(),
              MyButton(
                  text: "Log Out",
                  onTap: () async {
                    context.pop;

                    cubit.logOut();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
