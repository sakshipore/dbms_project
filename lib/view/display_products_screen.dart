import 'package:dbms_project/view/show_books_list.dart';
import 'package:dbms_project/view/show_stationary_list.dart';
import 'package:dbms_project/view/show_technical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dbms_project/widgets/text_box.dart';

class DisplayProductsScreen extends StatefulWidget {
  var userId;
  DisplayProductsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<DisplayProductsScreen> createState() => _DisplayProductsScreenState();
}

class _DisplayProductsScreenState extends State<DisplayProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220.h,
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
              child: TextBox(text: 'Books'),
            ),
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowStationaryList(),
                  ),
                );
              },
              child: TextBox(text: 'Stationary'),
            ),
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowTechnicalList(),
                  ),
                );
              }),
              child: TextBox(text: 'Technical'),
            ),
          ],
        ),
      ),
    );
  }
}
