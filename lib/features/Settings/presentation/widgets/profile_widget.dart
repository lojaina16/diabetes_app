import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/model/user_info.dart';
import 'package:diabetes/model/user_model.dart';
import 'package:flutter/material.dart';

class ShowProfileWidget extends StatelessWidget {
  const ShowProfileWidget({
    super.key,
    required this.user,
    required this.info,
  });

  final UserModel? user;
  final MyUserInfo? info;

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
              backgroundImage: AssetImage(info!.gender.contains('F')
                  ? "assets/images/girl.png"
                  : "assets/images/boy.png")),
        ),
      ],
    );
  }
}
