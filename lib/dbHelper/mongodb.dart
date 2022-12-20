import 'dart:developer';

import 'package:mark_my_attendance/dbHelper/constant.dart';
import 'package:mark_my_attendance/utils/names.dart';
import 'package:mongo_dart/mongo_dart.dart';
import './constant.dart';

class MongoDataBase {
  static var db, userCollection;
  //static List<dynamic> arrData = userCollection.find().toList();
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    //USER_COLLECTION = branchdropdownValue;
    userCollection = db.collection(branchdropdownValue);
  }

  // static changeCollection() {
  //   userCollection = db.collection(branchdropdownValue);
  //   getData();
  // }

  static getData() async {
    userCollection = db.collection(branchdropdownValue);
    var arrData = await userCollection.find().toList();
    //arrData.clear();
    //return arrData;
    // print(branchdropdownValue);
    // print(arrData);
    Subject.clear();
    Subject = List<String>.from(arrData[0][semesterdropdownValue]);
    // print(Subject);
    // print(semesterdropdownValue);
    //print(arrData[0]["1"]);
  }
}
