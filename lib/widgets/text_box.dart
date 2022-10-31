import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBox extends StatelessWidget {
   TextBox({Key? key, required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.h,
      width: 745.w,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
