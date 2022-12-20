import 'package:flutter/material.dart';

import '../utils/names.dart';
import '../widgets/dropDownWidget.dart';
import '../screens/attendencePage.dart';

class AttendenceDropDownpage2 extends StatefulWidget {
  const AttendenceDropDownpage2({Key? key}) : super(key: key);

  @override
  State<AttendenceDropDownpage2> createState() =>
      _AttendenceDropDownpage2State();
}

class _AttendenceDropDownpage2State extends State<AttendenceDropDownpage2> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    isSelectedList = List.filled(finalList.length, 0);
    attendencecolor = List.filled(80, Colors.white);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Attendance"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: mediaquery.size.height * 0.045,
          ),
          Center(
              child: Text(
            "Attendance Management System",
            style: TextStyle(
                fontSize: mediaquery.size.height * 0.022,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          )),
          Padding(
            padding: EdgeInsets.all(mediaquery.size.height * 0.025),
            child: Column(children: [
              SizedBox(
                height: mediaquery.size.height * 0.025,
              ),
              dropdown(
                  DropdownValue: perioddropdownValue,
                  sTring: Period,
                  Hint: "Period"),
              SizedBox(
                height: mediaquery.size.height * 0.025,
              ),
              dropdown(
                  DropdownValue: batchdropdownValue,
                  sTring: Batch,
                  Hint: "Batch"),
              SizedBox(
                height: mediaquery.size.height * 0.025,
              ),
              dropdown(
                  DropdownValue: subjectdropdownValue,
                  sTring: Subject,
                  Hint: "Subject"),
              SizedBox(
                height: mediaquery.size.height * 0.038,
              ),
              SizedBox(
                height: mediaquery.size.height * 0.025,
              ),
              Center(
                child: Container(
                  // height: 300,
                  width: mediaquery.size.width,
                  height: mediaquery.size.height * 0.25,
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaquery.size.height * 0.022),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.80),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaquery.size.height * 0.013,
                        ),
                        Text(
                          "$date",
                          style: TextStyle(
                              fontSize: mediaquery.size.height * 0.04),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(mediaquery.size.height * 0.010),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "Branch : $branchdropdownValue",
                                style: TextStyle(
                                    fontSize: mediaquery.size.height * 0.02),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text("Year : $yeardropdownValue",
                                      style: TextStyle(
                                          fontSize:
                                              mediaquery.size.height * 0.02))),
                              Expanded(
                                  child: Text(
                                      "Semester : $semesterdropdownValue",
                                      style: TextStyle(
                                          fontSize:
                                              mediaquery.size.height * 0.02)))
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding:
                              EdgeInsets.all(mediaquery.size.height * 0.011),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            mediaquery.size.width * 0.9,
                                            mediaquery.size.height * 0.05)),
                                    onPressed: () {
                                      // presentStudents = new List.empty(growable: true);
                                      // absentStudents = new List.empty(growable: true);
                                      clearList();
                                      print(presentStudents);
                                      print(absentStudents);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AttendencePage()),
                                      );
                                    },
                                    child: Text("Take Attendance",
                                        style: TextStyle(
                                            fontSize: mediaquery.size.height *
                                                0.02))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
