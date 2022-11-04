import 'dart:developer';

import 'package:dbms_project/db_helper/mongoDB.dart';
import 'package:dbms_project/model/mongodb_model.dart';
import 'package:dbms_project/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewUserEntryScreen extends StatefulWidget {
  const NewUserEntryScreen({Key? key}) : super(key: key);

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

  Future<void> _insertData(
      String fname, String lname, String address, String mobNo) async {
    setState(() {
      isLoading = true;
    });
    var _id = M.ObjectId();
    final data = MongoDBModel(
      id: _id,
      address: address,
      fname: fname,
      lname: lname,
      mobNo: mobNo,
    );
    var result = await MongoDatabase.insert(data);
    log(result);
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Inserted ID: ${_id.$oid}",
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
          : Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProductsScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Add a Product",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
