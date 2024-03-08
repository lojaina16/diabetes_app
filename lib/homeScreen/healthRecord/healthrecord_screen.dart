import 'package:flutter/material.dart';

class HealthRecord extends StatefulWidget {
  const HealthRecord({super.key});

  static const String routeName = "HealthRecordScreen";

  @override
  State<HealthRecord> createState() => _HealthRecordState();
}

class _HealthRecordState extends State<HealthRecord> {
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
            child: Text("Health Record",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(30),
                child: ListTile(
                  title: Text("Condition: Type 2"),
                  isThreeLine: true,
                  subtitle: Text("Blood Type: O+  \n"
                      "Weight: 55 kg\n"
                      "Gender: Female\n"
                      "Age: 21"),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff5F6583FF)),
                      child: Column(
                        children: [
                          Text(
                            "Blood Sugar Level",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 7,
                                color: Color(0xff5063BF),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "140 mg/dl",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff5063BF)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Change"))
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(thickness: 5),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff5F6583FF)),
                      child: Column(
                        children: [
                          Text(
                            "Your Target Goal",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 7,
                                color: Colors.green,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "80 mg/dl",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff5063BF)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Change"))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff5F6583FF)),
                      child: Column(
                        children: [
                          Text(
                            "HbA1c Test",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 7,
                                color: Colors.orange,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                " 6.5 % ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff5063BF),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Change"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
