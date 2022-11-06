import 'package:dbms_project/view/display_products_screen.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Text(
            "Home Screen",
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
                  builder: (context) => ProductsScreen(userId: widget.userId),
                ),
              );
            },
            child: TextBox(
              text: 'Sell a Product',
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
                  builder: (context) => DisplayProductsScreen(userId: widget.userId),
                ),
              );
            },
            child: TextBox(
              text: 'Buy a Product',
            ),
          ),
        ],
      ),
    );
  }
}
