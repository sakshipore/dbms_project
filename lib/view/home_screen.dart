import 'package:dbms_project/db_helper/mongoDB.dart';
import 'package:dbms_project/view/display_user_screen.dart';
import 'package:dbms_project/view/products_screen.dart';
import 'package:dbms_project/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    connectToDB();
  }

  void connectToDB() async {
    MongoDatabase db = MongoDatabase();
    await db.connect();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                        builder: (context) => DisplayUserScreen(),
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
                        builder: (context) => ProductsScreen(),
                      ),
                    );
                  },
                  child: TextBox(
                    text: 'Products',
                  ),
                ),
              ],
            ),
          );
  }
}
