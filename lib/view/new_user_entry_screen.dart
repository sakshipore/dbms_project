import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb.dart';
import 'package:dbms_project/model/mongodb_model.dart';
import 'package:dbms_project/view/home_screen.dart';
import 'package:dbms_project/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewUserEntryScreen extends StatefulWidget {
  NewUserEntryScreen({Key? key}) : super(key: key);

  @override
  State<NewUserEntryScreen> createState() => _NewUserEntryScreenState();
}

class _NewUserEntryScreenState extends State<NewUserEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  bool isLoading = false;
  var userId;

  Future<void> _insertData(
      String fname, String lname, String address, String mobNo) async {
    setState(() {
      isLoading = true;
    });
    userId = M.ObjectId();
    final data = MongoDBModel(
      id: userId,
      address: address,
      fname: fname,
      lname: lname,
      mobNo: mobNo,
      product: [],
    );
    var result = await MongoDatabase.insert(data);
    log(result);
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Inserted ID: ${userId.$oid}",
        ),
      ),
    );
    _clearAll();
  }

  void _clearAll() {
    addressController.text = "";
    fnameController.text = "";
    lnameController.text = "";
    mobNoController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.w),
                        child: Text(
                          "Create a new user",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      TextFormField(
                        controller: fnameController,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          hintText: "Enter your first name",
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please enter first name";
                          }
                          return null;
                        }),
                      ),
                      TextFormField(
                        controller: lnameController,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          hintText: "Enter your Last Name",
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please enter Last Name";
                          }
                          return null;
                        }),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "ID",
                      //     hintText: "Enter your ID",
                      //   ),
                      //   validator: ((value) {
                      //     if (value!.isEmpty) {
                      //       return "Please enter ID";
                      //     }
                      //     return null;
                      //   }),
                      // ),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: "Address",
                          hintText: "Enter your Address",
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please enter Address";
                          }
                          return null;
                        }),
                      ),
                      TextFormField(
                        controller: mobNoController,
                        decoration: InputDecoration(
                          labelText: "Moblie no",
                          hintText: "Enter your Moblie no",
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please enter Moblie no";
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
                            await _insertData(
                              fnameController.text,
                              lnameController.text,
                              addressController.text,
                              mobNoController.text,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(userId: userId),
                              ),
                            );
                          },
                          child: Text(
                            "Create user",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
