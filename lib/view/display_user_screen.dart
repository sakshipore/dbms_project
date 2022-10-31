import 'package:dbms_project/view/new_user_entry_screen.dart';
import 'package:dbms_project/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayUserScreen extends StatefulWidget {
  const DisplayUserScreen({Key? key}) : super(key: key);

  @override
  State<DisplayUserScreen> createState() => _DisplayUserScreenState();
}

class _DisplayUserScreenState extends State<DisplayUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220.h,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewUserEntryScreen(),
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
    );
  }
}
