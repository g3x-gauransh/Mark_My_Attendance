import 'dart:developer';

import 'package:mark_my_attendance/utils/names.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDataBase {
  static var db, userCollection;
  //static List<dynamic> arrData = userCollection.find().toList();
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    //USER_COLLECTION = branchdropdownValue;
    //userCollection = db.collection(branchdropdownValue);
    userCollection = db.collection((semesterdropdownValue));
  }

  // static changeCollection() {
  //   userCollection = db.collection(branchdropdownValue);
  //   getData();
  // }

  static getData() async {
    userCollection = db.collection((semesterdropdownValue));
    //print(yeardropdownValue);

    String aclass = "";
    print(batchdropdownValue);
    print(branchdropdownValue);
    if (semesterdropdownValue == "2" || semesterdropdownValue == "8") {
      aclass = batchdropdownValue;
    } else {
      aclass = branchdropdownValue;
    }

    print("aclass");
    print(aclass);
    var arrData = await userCollection.find({"name": aclass}).toList();
    //List<Map<String,Object?>>
    //arrData.clear();
    //return arrData;
    // print(branchdropdownValue);

    print("arrdata:");
    print(arrData[0]['subject']);
    Subject.clear();

    // print("arrdata:");
    // print(arrData.size());

    Subject = List<String>.from(arrData[0]['subject']);
    // print(Subject);
    // print(semesterdropdownValue);
    //print(arrData[0]["1"]);
  }
}
