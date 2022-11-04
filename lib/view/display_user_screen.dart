import 'package:dbms_project/view/delete_user_screen.dart';
import 'package:dbms_project/view/new_user_entry_screen.dart';
import 'package:dbms_project/view/products_screen.dart';
import 'package:dbms_project/view/show_users_list_screen.dart';
import 'package:dbms_project/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayUserScreen extends StatefulWidget {
  var userId;
  DisplayUserScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<DisplayUserScreen> createState() => _DisplayUserScreenState();
}

class _DisplayUserScreenState extends State<DisplayUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // SizedBox(height: 220.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(userId: widget.userId),
                ),
              );
            },
            child: TextBox(
              text: 'New Entry',
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ShowUsersListScreen(),
          //       ),
          //     );
          //   },
          //   child: TextBox(
          //     text: 'Show Users List',
          //   ),
          // ),
          // GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => DeleteUserScreen(),
          //         ),
          //       );
          //     },
          //     child: TextBox(
          //       text: "Delete User",
          // ),
          // ),
        ],
      ),
    );
  }
}
