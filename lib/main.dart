import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mark_my_attendance/dbHelper/MongoDbStudent.dart';
import 'package:mark_my_attendance/dbHelper/mongodb.dart';
import 'package:firebase_core/firebase_core.dart';

import './theme/colors.dart';
import './screens/select_branch.dart';
import './utils/names.dart';
import 'firebase_options.dart';
import './screens/loginScreen.dart';
import './dbHelper/loginMongoDB.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.removeAfter(initialization);

  await initialization(null);
  await StudentMongoDB.connect();
  await MongoDataBase.connect();
  await LoginMongoDB.connect();
  await StudentMongoDB.getStudentData();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  print(date);
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 5));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData =
        ThemeData(primarySwatch: newprimaryColor, dividerColor: Colors.white);
    // DE0000
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Management System',
      theme: themeData,
      //home: AttendenceDropdownPage1(),
      home: LoginScreen(),
    );
  }
}
