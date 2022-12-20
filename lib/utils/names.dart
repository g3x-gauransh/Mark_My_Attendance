//import 'dart:js';

import 'package:flutter/material.dart';
import '../models/Student.dart';
import 'package:intl/intl.dart';

//var mquery = MediaQuery.of(context as BuildContext);

List<String> Program = ["B.Tech"];

List<String> Semester = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
];

List<String> Period = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
];

List<String> Batch = ["Morning-1", "Morning-2", "Morning-3", "Evening"];

List<String> Branch = [
  "CSE",
  "IT",
  "ECE",
  "EEE",
];

List<String> Subject = [
  // "Artificial Intelligence",
  // "Theory of Computation",
  // "Object Oriented Programming",
  // "CN",
  // "Java",
  // "Industrial Management",
  // "Applied Maths-1",
  // "Applied Chemistry-1",
  // "Applied Physics-1",
  // "Compiler Design",
  // "Computer organisation and Architecture",
  // "Machine Learning",
];
List<String> Students = [];

List<int> isSelectedList = [];

List<String> presentStudents = [];
List<String> absentStudents = [];

List<StudentClass> finalList = [];

var today = new DateTime.now();
var now = DateFormat('dd-MM-yy');
var date = now.format(today);

List attendencecolor = [
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
  // Colors.white,
];
//  0, /*Absent*/    1, /*Present*/    2 /*Absent*/
String semesterdropdownValue = Semester[0];
String batchdropdownValue = Batch[0];
String subjectdropdownValue = Subject[0];
String yeardropdownValue = semesterdropdownValue;
String programdropdownValue = Program[0];
String branchdropdownValue = Branch[0];
String perioddropdownValue = Period[0];

// var user = "new_user1";
// var password = "g2oZtomUdCIYJ2k7";

var MONGO_CONN_URL =
    "mongodb+srv://new_user1:g2oZtomUdCIYJ2k7@cluster0.3zq3bok.mongodb.net/Subject?retryWrites=true&w=majority";
var USER_COLLECTION = branchdropdownValue;

void clearList() {
  absentStudents.clear();
  presentStudents.clear();
}
