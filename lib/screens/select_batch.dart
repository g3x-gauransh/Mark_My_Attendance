import 'package:flutter/material.dart';
import 'package:mark_my_attendance/screens/select_branch_page2.dart';

import '../dbHelper/mongodb.dart';
import '../utils/names.dart';
import '../widgets/dropDownWidget.dart';

class BatchScreen extends StatefulWidget {
  const BatchScreen({Key? key}) : super(key: key);

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Management System'),
      ),
      body:Padding(padding: EdgeInsets.all(mediaquery.size.width * 0.05), //15.0
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
          ),Padding(
        padding: EdgeInsets.all(mediaquery.size.width * 0.025),
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
            Hint: "Batch",
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
            onPressed: () async {
              // MongoDataBase.changeCollection();
              // yeardropdownValue =
              //     (double.parse(semesterdropdownValue) / 2).ceil().toString();
              //print(yeardropdownValue);
              Subject.clear();
              await MongoDataBase.getData();
              // setState(() {
              //   print("checkBranch: $branchdropdownValue");
              //   Batch = CheckBranch();
              //   // print()
              // });
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AttendenceDropDownpage2()),
              );
            },
            child: Container(
              width: mediaquery.size.width * 0.4,
              height: mediaquery.size.height * 0.05,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                      colors: <Color>[Colors.orange[200]!, Colors.pinkAccent])),
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: mediaquery.size.height * 0.025,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ]),
      ),],))
    );
  }
}
