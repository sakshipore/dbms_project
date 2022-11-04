import 'package:dbms_project/db_helper/mongodb.dart';
import 'package:dbms_project/view/home_screen.dart';
import 'package:dbms_project/view/new_user_entry_screen.dart';
import 'package:dbms_project/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobNoController = TextEditingController();
  bool isLoading = true;
  var userId;

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
    return Scaffold(
      body: isLoading
          ? Center(
              child: Text(
                "Connecting to Database...",
              ),
            )
          : Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  TextFormField(
                    controller: mobNoController,
                    decoration: InputDecoration(
                      labelText: "Enter Mobile No",
                      hintText: "Enter your Mobile No",
                    ),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Please enter Mobile No";
                      }
                      return null;
                    }),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        var userData =
                            await MongoDatabase.checkUser(mobNoController.text);

                        if (userData == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "User doesn't exists",
                              ),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewUserEntryScreen(),
                            ),
                          );
                        } else {
                          userId = userData['id'];
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "User exists: " + userId.toString(),
                              ),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(userId: userId),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
