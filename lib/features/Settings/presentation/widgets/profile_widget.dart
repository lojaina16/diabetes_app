import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/model/user_model.dart';
import 'package:flutter/material.dart';

class ShowProfileWidget extends StatelessWidget {
  const ShowProfileWidget({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: context.width,
          margin: EdgeInsets.only(left: context.width * 0.3),
          color: HexColor("#CFD4FF"),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.width * 0.55),
                child: Text(
                  "${user?.name}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.width * 0.55),
                child: Text(
                  "${user?.email}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: context.width * 0.02),
          child: CircleAvatar(
            radius: context.width * 0.17,
            backgroundImage: const NetworkImage(
                "https://s3-alpha-sig.figma.com/img/76f3/728e/766f0bd0cd895fa11545705a9c7b5d05?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xz3ngKw2cgAT9Rd5luNq0Z7Zz9jVBB0KlFeiUZP2gy3umsKwHEJlw~OKg4d4a2YB5FHHFMz0Qe8sW~B4Pk9gqUPxed2u8htRk7T02P51m6uWr-SCijdm-I7Koi12HX2Wc0u~A6QytpFFdb7yNtK0g3MUevPoyWzJKM53wi7UV-B4ytqHMH4rOA9CCoihEIiOR9Hw4MAf7wUugSlVhExuPy01C~mMsaQEcNi-qiVN2UkLX3aDJ2VPmZsxk8Xy-fozDi9-IPIKE~LnpHyEwU8mF0of4AdFgn2tYSfTCrfLc5BNL9lh0FxVNPU4P-BTb6H1G10YN12Ly8l2VYZrO7-atQ__"),
          ),
        ),
      ],
    );
  }
}
