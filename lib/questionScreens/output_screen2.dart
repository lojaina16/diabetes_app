import 'package:dibates/homeScreen/categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OutputScreen2 extends StatelessWidget {
  static const String routeName = "OutputScreen2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset("assets/lottie/done2.json",
                width: 400, height: 400, fit: BoxFit.fill),
            Text("Negative",
                style: GoogleFonts.jockeyOne(
                    fontSize: 35,
                    color: Color(0xff25B800),
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
