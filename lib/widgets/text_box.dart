import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBox extends StatelessWidget {
  TextBox({Key? key, required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 500.w,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
