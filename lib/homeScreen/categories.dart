import 'package:flutter/material.dart';

import 'imageWidget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
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
              Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined, size: 40),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Diabetes App",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Settings",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("About Application",
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
              Text(
                " How Can We \n Help You ? ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Pick Your \n Category ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.all(3),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Row(children: [
                            ImageWidget("2", "Emergency Calls"),
                            SizedBox(
                              width: 2,
                            ),
                            ImageWidget("4", "Health Records")
                          ]),
                          Row(children: [
                            ImageWidget("6", "Physical Activates"),
                            SizedBox(
                              width: 2,
                            ),
                            ImageWidget("8", "Nutrition Plan")
                          ]),
                          Row(children: [
                            ImageWidget("10", "Medication Follow-up "),
                            SizedBox(
                              width: 2,
                            ),
                            ImageWidget("12", "Ask Your Doctor ")
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
