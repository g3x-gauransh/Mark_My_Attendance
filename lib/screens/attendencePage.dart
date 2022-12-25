import 'dart:io';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../utils/names.dart';
import '../theme/colors.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../dbHelper/MongoDbStudent.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  final studentvar = finalList;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Attendance"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mediaquery.size.height * 0.02,
          ),
          Center(
            child: Text(
              "Select those who are present and \n     long press for more options",
              style: TextStyle(
                  fontSize: mediaquery.size.height * 0.02,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: mediaquery.size.height * 0.025,
          ),
          Container(
            height: mediaquery.size.height * 0.6,
            width: mediaquery.size.width,
            // color: Colors.orange,
            child: new ListView.builder(
                itemCount: studentvar.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildAttendenceCard(context, index, mediaquery)),
            // ListTile(

            // )),
          ),
          SizedBox(
            height: mediaquery.size.height * 0.028,
          ),
          //
          //
          //
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  content: Builder(
                    builder: (context) {
                      var height = MediaQuery.of(context).size.height;
                      var width = MediaQuery.of(context).size.height;
                      return Container(
                        height: height * 0.025,
                        width: width * 0.3,
                      );
                    },
                  ),
                  title: Text('Submit Attendance?',
                      style:
                          TextStyle(fontSize: mediaquery.size.height * 0.02)),
                  // content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text('Cancel',
                          style: TextStyle(
                              fontSize: mediaquery.size.height * 0.02)),
                    ),
                    TextButton(
                      onPressed: () async => {
                        checkInternet(),
                        ResetState(),
                        UpdateLists(),
                        UpdateDB(),
                        clearList(),
                        Navigator.pop(
                          context,
                          'Submit',
                        ),
                        checkUpdateDB(),
                      },
                      child: Text('Submit',
                          style: TextStyle(
                              fontSize: mediaquery.size.height * 0.02)),
                    ),
                  ],
                ),
              ),
              child: Container(
                height: mediaquery.size.height * 0.05,
                width: mediaquery.size.width * 0.7,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.orange[200]!,
                      Colors.pinkAccent
                    ])),
                child: Text('Submit',
                    style: TextStyle(fontSize: mediaquery.size.height * 0.02)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildAttendenceCard(
      BuildContext context, int index, MediaQueryData mediaquery) {
    var index2 = index + 1;

    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.75,
      duration: Duration(milliseconds: 350),
      animateMenuItems: true,
      onPressed: () {
        setState(() {
          ChangeState(isSelectedList, index, 1);
          ChangeColor(isSelectedList, index);
        });
      },
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
            title: Text(
              "Present",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: mediaquery.size.height * 0.02),
            ),
            onPressed: () {
              setState(() {
                ChangeState(isSelectedList, index, 1);
                ChangeColor(isSelectedList, index);
              });
            },
            backgroundColor: green),
        //00CE2D
        FocusedMenuItem(
            title: Text(
              "Absent",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: mediaquery.size.height * 0.02),
            ),
            onPressed: () {
              setState(() {
                ChangeState(isSelectedList, index, 0);
                ChangeColor(isSelectedList, index);
              });
            },
            backgroundColor: red),
      ],
      child: new Container(
        child: Card(
          color: attendencecolor[index],
          elevation: 2,
          shadowColor: Colors.grey[200],
          child: Padding(
            padding: EdgeInsets.all(mediaquery.size.height * 0.015),
            child: Row(
              children: <Widget>[
                Text(
                  index2.toString(),
                  style: TextStyle(fontSize: mediaquery.size.height * 0.02),
                ),
                SizedBox(
                  width: mediaquery.size.height * 0.028,
                ),
                Text(
                  studentvar[index].name,
                  style: TextStyle(fontSize: mediaquery.size.height * 0.025),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ChangeState(List<int> isSelectedList, int value, int i) {
    isSelectedList[value] = i;
  }

  void ResetState() {
    for (int state = 0; state < attendencecolor.length; state++) {
      attendencecolor[state] = Colors.white;
    }
  }

  void ChangeColor(List<int> isSelectedList, int index) {
    if (isSelectedList[index] == 1) {
      attendencecolor[index] = green;
      // print("changed to : "+ isSelectedList.toString());
    } else {
      if (isSelectedList[index] == 2) {
        attendencecolor[index] = yellow;
        // print("changed to : "+ isSelectedList.toString());
      } else {
        attendencecolor[index] = red;
        // print("changed to : "+ isSelectedList.toString());
      }
    }
  }

  void UpdateLists() {
    for (int i = 0; i < finalList.length; i++) {
      if (isSelectedList[i] == 0) {
        absentStudents.add(finalList[i].enrol.toString());
      } else {
        presentStudents.add(finalList[i].enrol.toString());
      }
    }
    print(absentStudents);
    print(presentStudents);
  }

  void UpdateDB() {
    for (int i = 0; i < presentStudents.length; i++) {
      StudentMongoDB.update(int.parse(presentStudents[i]), 1);
    }

    for (int i = 0; i < absentStudents.length; i++) {
      StudentMongoDB.update(int.parse(absentStudents[i]), 0);
    }

    presentStudents.removeRange(0, presentStudents.length);
    absentStudents.removeRange(0, absentStudents.length);

    //print()
  }

  void checkUpdateDB() {
    if (StudentMongoDB().checkDB == false) {
      print('false toast');
      MotionToast(
        icon: Icons.alarm,
        primaryColor: Colors.red,
        description: Text(
            'Attendance not updated\n Please check your internet connection'),
      ).show(context);
    } else {
      print('true toast');
      MotionToast(
        icon: Icons.message,
        primaryColor: Colors.green,
        description: Text('Attendance Recorded Successfully'),
      ).show(context);
    }
  }

  void checkInternet() async {
    try {
      final result = await InternetAddress.lookup('msit.in');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected to Internet');
      }
    } on SocketException catch (_) {
      print('Not connected to internet');
      MotionToast(
        icon: Icons.alarm,
        primaryColor: Colors.red,
        description: Text(
            'Attendance not updated\n Please check your internet connection'),
      ).show(context);
    }
  }
}
