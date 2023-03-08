import 'package:flutter/material.dart';
import 'package:mark_my_attendance/dbHelper/mongodb.dart';
import 'package:mark_my_attendance/screens/select_batch.dart';
import 'package:mark_my_attendance/theme/colors.dart';

import '../widgets/dropDownWidget.dart';
import '../utils/names.dart';
import '../screens/select_branch_page2.dart';
import '../widgets/drawer.dart';

class AttendenceDropdownPage1 extends StatefulWidget {
  const AttendenceDropdownPage1({Key? key}) : super(key: key);

  @override
  State<AttendenceDropdownPage1> createState() =>
      _AttendenceDropdownPage1State();
}

class _AttendenceDropdownPage1State extends State<AttendenceDropdownPage1> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    print(mediaquery.size.height);
    print(mediaquery.size.width);
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: Text('Attendance Management System'),
      ),
      body: Padding(
        padding: EdgeInsets.all(mediaquery.size.width * 0.05), //15.0
        child: ListView(physics: BouncingScrollPhysics(), children: [
          Row(
            children: [
              Center(
                child: Container(
                  //decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Image.asset('asset/MSIT.png'),
                  width: mediaquery.size.width * 0.3, //105
                  height: mediaquery.size.width * 0.3, //105
                ),
              ),
              Expanded(
                  child: Text(
                'Maharaja Surajmal Institute Of Technology',
                style: TextStyle(
                    fontSize: mediaquery.size.height * 0.027,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ))
            ],
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Center(
          //     child: Text(
          //   "Attendence Management System",
          //   style: TextStyle(
          //       fontSize: 24, fontWeight: FontWeight.w300, color: Colors.black),
          // )),
          // const SizedBox(
          //   height: 30,
          // ),
          Padding(
            padding: EdgeInsets.all(mediaquery.size.width * 0.025), //10
            child: Column(
              children: [
                SizedBox(
                  height: mediaquery.size.height * 0.04,
                ),
                dropdown(
                  DropdownValue: programdropdownValue,
                  Hint: "Program",
                  sTring: Program,
                ),
                SizedBox(
                  height: mediaquery.size.height * 0.025,
                ),
                // dropdown(
                //     DropdownValue: schooldropdownValue,
                //     Hint: "School",
                //     sTring: School),
                // const SizedBox(
                //   height: 20,
                // ),
                dropdown(
                    DropdownValue: branchdropdownValue,
                    sTring: Branch,
                    Hint: "Branch"),
                SizedBox(
                  height: mediaquery.size.height * 0.025,
                ),
                dropdown(
                    DropdownValue: semesterdropdownValue,
                    sTring: Semester,
                    Hint: "Semester"),
                // SizedBox(
                //   height: 20,
                // ),
                // dropdown(
                //     DropdownValue: yeardropdownValue,
                //     sTring: CollegeYear,
                //     Hint: "Year"),
                const SizedBox(
                  height: 20,
                ),
                // dropdownButton(batchdropdownValue,Batch,"Batch"),
                // SizedBox(
                //   height: mediaquery.size.height * 0.025,
                // ),
                // dropdown(
                //     DropdownValue: batchdropdownValue,
                //     sTring: Batch,
                //     Hint: "Batch"),
                // SizedBox(
                //   height: mediaquery.size.height * 0.025,
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () {
                    // MongoDataBase.changeCollection();
                    yeardropdownValue =
                        (double.parse(semesterdropdownValue) / 2)
                            .ceil()
                            .toString();
                    //print(yeardropdownValue);
                    // Subject.clear();
                    // await MongoDataBase.getData();
                    setState(() {
                      print("checkBranch: $branchdropdownValue");
                      Batch = CheckBranch();
                      // print()
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => BatchScreen()),
                    );
                  },
                  child: Container(
                    width: mediaquery.size.width * 0.4,
                    height: mediaquery.size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(colors: <Color>[
                          Colors.orange[200]!,
                          Colors.pinkAccent
                        ])),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: mediaquery.size.height * 0.025,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //     //minimumSize: Size(300, 60),
                  //     // primary: Color.fromARGB(255, 255, 71, 26),
                  //     // onPrimary: Colors.black,
                  //     elevation: 15,
                  //     textStyle: TextStyle(
                  //         fontSize: mediaquery.size.height * 0.025,
                  //         fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
