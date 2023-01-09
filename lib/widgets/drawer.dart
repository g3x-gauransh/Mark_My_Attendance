import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(
                top: mediaquery.size.height * 0.065,
                left: mediaquery.size.width * 0.07),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "MarkED",
                      style: TextStyle(
                        fontSize: mediaquery.size.height * 0.03,
                        fontWeight: FontWeight.w500,
                        color: Colors.red[300],
                      ),
                      //textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: mediaquery.size.height * 0.025,
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
          },
          leading: Icon(
            Icons.check_circle,
            color: Colors.pink,
          ),
          title: Text("Mark Attendance"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.school,
            color: Colors.pink,
          ),
          title: Text("Enter Marks"),
        ),
      ],
    );
  }
}
