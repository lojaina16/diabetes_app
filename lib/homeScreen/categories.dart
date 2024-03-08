import 'package:diabetes_app/homeScreen/emergencyCall_screen.dart';
import 'package:flutter/material.dart';

import 'healthRecord/healthrecord_screen.dart';
import 'imageWidget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff5063BF),
        toolbarHeight: 80,
        elevation: 0,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Diabetes App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.person_2_rounded)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Name@Email.com",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Color(0xff7588E4),
                      size: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Settings",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Color(0xff7588E4),
                      size: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("About App",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.all(3),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Row(children: [
                            ImageWidget("emergency", "Emergency Calls",
                                EmergencyCall.routeName),
                            SizedBox(
                              width: 2,
                            ),
                            ImageWidget("health", "Health Records",
                                HealthRecord.routeName)
                          ]),
                          Row(children: [
                            ImageWidget("activity", "Physical Activates",
                                HealthRecord.routeName),
                            SizedBox(
                              width: 2,
                            ),
                            ImageWidget(
                                "dr", "Ask Your Doctor", HealthRecord.routeName)
                          ]),
                          Row(children: [
                            ImageWidget("plan", "Nutrition Plan ",
                                HealthRecord.routeName),
                            SizedBox(
                              width: 2,
                            ),
                            ImageWidget("medication", "Medication Follow-up ",
                                HealthRecord.routeName)
                          ]),
                        ]),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
