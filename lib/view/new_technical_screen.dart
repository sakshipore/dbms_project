import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb_technical.dart';
import 'package:dbms_project/model/technical.dart';
import 'package:dbms_project/view/new_user_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewTechnicalScreen extends StatefulWidget {
  var userId;
  NewTechnicalScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<NewTechnicalScreen> createState() => _NewTechnicalScreenState();
}

class _NewTechnicalScreenState extends State<NewTechnicalScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController modelNoController = TextEditingController();
  TextEditingController specificationController = TextEditingController();
  TextEditingController billNoController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  bool isLoading = false;
  var _id;

  Future<void> _insertData(String name, String modelNo, String specification,
      String billNo, String companyName, String cost) async {
    setState(() {
      isLoading = true;
    });
    _id = M.ObjectId();
    final data = Technical(
      id: _id,
      name: name,
      modelNo: modelNo,
      specification: specification,
      billNo: billNo,
      companyName: companyName,
      cost: cost,
    );
    var result = await MongoDatabaseTechnical().insert(data.toJson());
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
    nameController.text = "";
    modelNoController.text = "";
    specificationController.text = "";
    billNoController.text = "";
    companyNameController.text = "";
    costController.text = "";
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
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter your Name",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Name";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: companyNameController,
                      decoration: InputDecoration(
                        labelText: "Company Name",
                        hintText: "Enter your Company Name",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Company Name";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: modelNoController,
                      decoration: InputDecoration(
                        labelText: "Model no",
                        hintText: "Enter your Model no",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Model no";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: specificationController,
                      decoration: InputDecoration(
                        labelText: "Specification",
                        hintText: "Enter your Specification",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Specification";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: billNoController,
                      decoration: InputDecoration(
                        labelText: "Bill no",
                        hintText: "Enter your Bill no",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Bill no";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: costController,
                      decoration: InputDecoration(
                        labelText: "Cost",
                        hintText: "Enter your Cost",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Cost";
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
                            nameController.text,
                            modelNoController.text,
                            specificationController.text,
                            billNoController.text,
                            companyNameController.text,
                            costController.text,
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           NewUserEntryScreen(id: _id)),
                          // );
                        },
                        child: Text(
                          "Add Technical Product",
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
