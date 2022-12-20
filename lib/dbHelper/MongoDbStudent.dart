import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mark_my_attendance/models/userDetailModel.dart';
import 'package:mark_my_attendance/utils/names.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../screens/attendencePage.dart';
import '../models/Student.dart';

class StudentMongoDB {
  static var db, userCollection;

  // static var StudentURL =
  //     "mongodb+srv://new_user1:g2oZtomUdCIYJ2k7@cluster0.3zq3bok.mongodb.net/Details?retryWrites=true&w=majority";
  static var StudentURL =
      "mongodb+srv://new_user1:g2oZtomUdCIYJ2k7@cluster0.3zq3bok.mongodb.net/Detail?retryWrites=true&w=majority"; //database for original data
  static var Collection = "Test";
  //static List<dynamic> arrData = userCollection.find().toList();
  static connect() async {
    db = await Db.create(StudentURL);
    await db.open();
    inspect(db);
    //USER_COLLECTION = branchdropdownValue;
    userCollection = db.collection(Collection);
  }

  static getStudentData() async {
    var studentList = await userCollection.find().toList();
    // print(studentList);
    // print(studentList[0]['name']);
    // studentList.forEach((element) => studentName?.add(element['name']));
    // for (int i = 0; i < studentList.length;i++){
    //   studentName = List<String>.from(studentList[i]['name']);

    // }
    //print(studentList);
    // print(studentName);
    // presentStudents.clear();
    // absentStudents.clear();
    print(studentList[0]['_id'].runtimeType);
    Students.clear();
    (studentList.forEach((element) => finalList
        .add(StudentClass(name: element['name'], enrol: element['erol']))));
    // studentList
    //     .forEach((element) => print(element['date']['01-01-01'][0]['1']));
    //print(Students);

    //finalList.sort((a, b) => a.enrol.compareTo(b.enrol));

    // finalList.forEach((element) {
    //   print(element.name);
    //   print(element.enrol);
    // });
  }

  static update(int erol, int check) async {
    var result = await userCollection.findOne({"erol": erol});

    var value = [
      {perioddropdownValue: (check == 0 ? false : true)},
      0
    ];

    if (result['date'][date] == null) {
      print("null hai");
      result['date'][date] = value;
    } else {
      if (check == 0) {
        result['date'][date][0][perioddropdownValue] = false;
      } else {
        result['date'][date][0][perioddropdownValue] = true;
      }
    }
    if (result['temp'] == null) {
      result['temp'] = {};
    }
    result['temp'][perioddropdownValue] = subjectdropdownValue;
    print(subjectdropdownValue);
    print(await userCollection.save(result));
    //mapSubject(erol);
  }

  //element['date']['01-01-01'][0]['1']
}


//class JsonObject {}
