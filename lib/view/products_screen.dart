import 'package:dbms_project/view/display_book_screen.dart';
import 'package:dbms_project/view/display_stationary_screen.dart';
import 'package:dbms_project/view/display_technical_screen.dart';
import 'package:dbms_project/view/display_user_screen.dart';
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
                  builder: (context) => DisplayBookScreen(userId: widget.userId),
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
                  builder: (context) => DisplayStationaryScreen(userId: widget.userId),
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
                  builder: (context) => DisplayTechnicalScreen(userId: widget.userId),
                ),
              );
            }),
            child: TextBox(text: 'Technical'),
          ),
        ],
      ),
    );
  }
}
