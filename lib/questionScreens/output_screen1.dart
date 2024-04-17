import 'package:dibates/homeScreen/categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OutputScreen1 extends StatelessWidget {
  static const String routeName = "OutputScreen1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset("assets/lottie/warning.json",
                width: 300, height: 300, fit: BoxFit.fill),
            Text("positive",
                style: GoogleFonts.jockeyOne(
                    fontSize: 35,
                    color: Color(0xffE50000),
                    fontWeight: FontWeight.bold)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5066C0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    fixedSize: Size(200, 80)),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
