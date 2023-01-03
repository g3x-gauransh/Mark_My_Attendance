import 'package:flutter/material.dart';
import 'package:mark_my_attendance/dbHelper/loginMongoDB.dart';
import 'package:motion_toast/motion_toast.dart';

import './attendencePage.dart';
import './select_branch.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var inputEmail = "";
  var inputPassword = "";
  late bool check;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: mediaquery.size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset('asset/MarkED-logo.jpg'),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(mediaquery.size.height * 0.025),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: mediaquery.size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: mediaquery.size.height * 0.0125),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.pink,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            //print("onchanged: $inputEmail");
                            setState(() {
                              inputEmail = value;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaquery.size.height * 0.02),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: mediaquery.size.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.pink,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            //print("onchanged");
                            setState(() {
                              inputPassword = value;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaquery.size.height * 0.04), //35
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          onPressed: () async{
                            var c=await LoginMongoDB()
                                .Authentication(inputEmail, inputPassword);
                            print("check: $c");
                            if (c == true) {
                              print("WOrking");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AttendenceDropdownPage1()),
                              );
                            } else {
                              print("false");
                              MotionToast(
                                animationDuration: Duration(milliseconds: 3000),
                                height: mediaquery.size.height * 0.1,
                                width: mediaquery.size.width * 0.7,
                                icon: Icons.alarm,
                                primaryColor: Colors.red,
                                description: Text('Invalid Email Or Password'),
                              ).show(context);
                            }
                          },
                          child: Container(
                            height: mediaquery.size.height * 0.06,
                            width: mediaquery.size.width * 0.9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                gradient: LinearGradient(colors: <Color>[
                                  Colors.orange[200]!,
                                  Colors.pinkAccent
                                ])),
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: mediaquery.size.height * 0.03)),
                          )),

                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 AttendenceDropdownPage1()));
                      //   },
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Colors.black,
                      //     ),
                      //     child: Center(
                      //       child: Padding(
                      //         padding: EdgeInsets.all(
                      //             mediaquery.size.height * 0.0125),
                      //         child: Text(
                      //           ' Log In',
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 30,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //   const SizedBox(height: 35),
                      //   const Center(
                      //     child: Text(
                      //       '- Or Sign In with -',
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ),
                      //   const SizedBox(height: 20),
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       GestureDetector(
                      //         onTap: () {
                      //           Navigator.push(context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => AttendenceDropdownPage1()));
                      //         },
                      //         child: Container(
                      //           width: 60,
                      //           height: 60,
                      //           padding: const EdgeInsets.all(5),
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(15),
                      //             color: Colors.white38,
                      //           ),
                      //           child: Image.asset('lib/images/google.png'),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 50),
                      //       GestureDetector(
                      //         onTap: () {
                      //           Navigator.push(context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => AttendenceDropdownPage1()));
                      //         },
                      //         child: Container(
                      //           width: 60,
                      //           height: 60,
                      //           padding: const EdgeInsets.all(5),
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(15),
                      //             color: Colors.white38,
                      //           ),
                      //           child: Image.asset('lib/images/facebook.png'),
                      //         ),
                      //       ),
                      //     ],
                      //   )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
