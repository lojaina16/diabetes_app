import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/home/model/home_category.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final HomeCategory category;

  const ImageWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final image = category.image;
    final text = category.text;
    final route = category.route;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          child: Image.asset(
            "assets/images/$image.png",
          ),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
        ),
        Container(
            padding: const EdgeInsets.all(5),
            color: AppColors.black2.withOpacity(0.7),
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ))
      ],
    );
  }
}
