import 'package:dbms_project/view/new_book_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbms_project/widgets/text_box.dart';

class DisplayBookScreen extends StatelessWidget {
  const DisplayBookScreen({Key? key}) : super(key: key);

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
                builder: (context) => NewBookEntryScreen(),
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
