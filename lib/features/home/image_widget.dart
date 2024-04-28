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

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/$image.png",
          ),
          const SizedBox(
            height: 8,
          ),
          Card(
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
