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

// List<String> Batch = ["Morning-1", "Morning-2", "Morning-3", "Evening"];
List<String> Batch = CheckBranch();

List<String> CheckBranch() {
  if (branchdropdownValue == "CSE")
    return ["CSE-1", "CSE-2", "CSE-3", "CSE-4"];
  else if (branchdropdownValue == "IT")
    return ["IT-1", "IT-2", "IT-3"];
  else if (branchdropdownValue == "ECE")
    return ["ECE-1", "ECE-2", "ECE-3"];
  else {
    return ["EEE"];
  }
}

List<String> Branch = [
  "CSE",
  "IT",
  "ECE",
  "EEE",
];

List<String> Subject = [];
List<String> Students = [];

List<int> isSelectedList = [];

List<String> presentStudents = [];
List<String> absentStudents = [];

List<StudentClass> finalList = [];

var today = new DateTime.now();
var now = DateFormat('dd-MM-yy');
var date = now.format(today);

List attendencecolor = [];
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

var MONGO_CONN_URL_TEACHER_LOGIN =
    "mongodb+srv://new_user1:g2oZtomUdCIYJ2k7@cluster0.3zq3bok.mongodb.net/LoginAuthentication?retryWrites=true&w=majority";

void clearList() {
  absentStudents.clear();
  presentStudents.clear();
}
