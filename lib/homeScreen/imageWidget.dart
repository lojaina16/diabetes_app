import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String x;
  String text;

  ImageWidget(this.x, this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset("assets/images/$x.jpg", width: 300),
        Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            color: Color.fromARGB(120, 0, 0, 0),
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ))
      ],
    ));
  }
}
