import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String text;
  final String route;
  final String x;

  const ImageWidget(this.x, this.text, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          child: Image.asset("assets/images/$x.png", width: 500),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
        ),
        Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            color: const Color.fromARGB(120, 0, 0, 0),
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ))
      ],
    ));
  }
}
