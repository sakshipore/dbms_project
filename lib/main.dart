import 'package:dbms_project/db_helper/mongodb.dart';
import 'package:dbms_project/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 840),
      minTextAdapt: true,
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      }),
    );
  }
}
