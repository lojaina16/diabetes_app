import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/76f3/728e/766f0bd0cd895fa11545705a9c7b5d05?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xz3ngKw2cgAT9Rd5luNq0Z7Zz9jVBB0KlFeiUZP2gy3umsKwHEJlw~OKg4d4a2YB5FHHFMz0Qe8sW~B4Pk9gqUPxed2u8htRk7T02P51m6uWr-SCijdm-I7Koi12HX2Wc0u~A6QytpFFdb7yNtK0g3MUevPoyWzJKM53wi7UV-B4ytqHMH4rOA9CCoihEIiOR9Hw4MAf7wUugSlVhExuPy01C~mMsaQEcNi-qiVN2UkLX3aDJ2VPmZsxk8Xy-fozDi9-IPIKE~LnpHyEwU8mF0of4AdFgn2tYSfTCrfLc5BNL9lh0FxVNPU4P-BTb6H1G10YN12Ly8l2VYZrO7-atQ__"),
              ),
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
                onTap: () {
                  context.pop;
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
                  onTap: () async{
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
