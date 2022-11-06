import 'package:dbms_project/view/new_book_entry_screen.dart';
import 'package:dbms_project/view/show_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbms_project/widgets/text_box.dart';

class DisplayBookScreen extends StatelessWidget {
  var userId;
  DisplayBookScreen({Key? key, required this.userId}) : super(key: key);

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
                  builder: (context) => NewBookEntryScreen(userId: userId),
                ),
              );
            },
            child: TextBox(text: 'New Entry'),
          ),
          SizedBox(
            height: 200.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowBooksList(),
                ),
              );
            },
            child: TextBox(text: 'Show Books List'),
          ),
        ],
      ),
    );
  }
}
