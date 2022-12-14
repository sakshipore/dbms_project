import 'package:dbms_project/view/new_book_entry_screen.dart';
import 'package:dbms_project/view/new_stationary_screen.dart';
import 'package:dbms_project/view/new_technical_screen.dart';
import 'package:dbms_project/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  var userId;
  ProductsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text(
              "Products",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewBookEntryScreen(userId: widget.userId),
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
                    builder: (context) =>
                        NewStationaryScreen(userId: widget.userId),
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
                    builder: (context) =>
                        NewTechnicalScreen(userId: widget.userId),
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
