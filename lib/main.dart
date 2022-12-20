import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mark_my_attendance/dbHelper/MongoDbStudent.dart';
import 'package:mark_my_attendance/dbHelper/mongodb.dart';

import './theme/colors.dart';
import './screens/select_branch.dart';
import './utils/names.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.removeAfter(initialization);

  await initialization(null);
  await StudentMongoDB.connect();
  await MongoDataBase.connect();
  await StudentMongoDB.getStudentData();
  print(date);
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 5));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
        primarySwatch: primaryColor,
        dividerColor: Colors.black);
    // DE0000
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Management System',
      theme: themeData,
      home: AttendenceDropdownPage1(),
    );
  }
}
