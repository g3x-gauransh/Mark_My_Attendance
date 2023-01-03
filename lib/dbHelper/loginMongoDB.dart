import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mark_my_attendance/utils/names.dart';
import '../screens/loginScreen.dart';

class LoginMongoDB {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL_TEACHER_LOGIN);
    await db.open();
    inspect(db);
    //USER_COLLECTION = branchdropdownValue;
    userCollection = db.collection("Teacher");
  }

  Future<bool> Authentication(String email, String password) async {
    // print("Email: ${LoginScreenState().inputEmail}");
    // print("Password: ${LoginScreenState().inputPassword}");
    print("email: $email");
    print("password: $password");
    var result =
        await userCollection.findOne({"email": email, "password": password});
    print(result);

    if (result == null) {
      print("auth not working");
      LoginScreenState().check = false;
      return false;
    } else {
      print("auth working");
      LoginScreenState().check = true;
      return true;
    }
  }
}
