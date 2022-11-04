import 'package:dbms_project/view/display_user_screen.dart';
import 'package:dbms_project/view/products_screen.dart';
import 'package:dbms_project/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  var userId;
  HomeScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  builder: (context) =>
                      DisplayUserScreen(userId: widget.userId),
                ),
              );
            },
            child: TextBox(
              text: 'Sell a Product',
            ),
          ),
          SizedBox(
            height: 200.h,
          ),
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
              text: 'See Products',
            ),
          ),
        ],
      ),
    );
  }
}
