import 'package:dbms_project/view/new_stationary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbms_project/widgets/text_box.dart';

class DisplayStationaryScreen extends StatelessWidget {
  var userId;
  DisplayStationaryScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 220.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewStationaryScreen(userId: userId,),
                ),
              );
            },
            child: TextBox(text: 'New Entry'),
          ),
          SizedBox(
            height: 200.h,
          ),
          // TextBox(text: 'Show Users List'),
        ],
      ),
    );
  }
}
