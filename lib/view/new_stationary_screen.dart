import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb_stationary.dart';
import 'package:dbms_project/model/stationary.dart';
import 'package:dbms_project/view/home_screen.dart';
import 'package:dbms_project/view/new_user_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:dbms_project/db_helper/mongodb.dart';

class NewStationaryScreen extends StatefulWidget {
  var userId;
  NewStationaryScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<NewStationaryScreen> createState() => _NewStationaryScreenState();
}

class _NewStationaryScreenState extends State<NewStationaryScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController itemController = TextEditingController();
  TextEditingController costController = TextEditingController();
  bool isLoading = false;
  var _id;

  Future<void> _updateData(var productId) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic>? userData =
        await MongoDatabase.fetchUserData(widget.userId);
    if (userData == null) return;
    List productIds = userData["product"];
    productIds.add(productId);
    var result = await MongoDatabase.update(widget.userId, productIds);
    log(result.toString());
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Updated ID: $productId",
        ),
      ),
    );
    _clearAll();
  }

  Future<void> _insertData(String item, String cost) async {
    setState(() {
      isLoading = true;
    });
    _id = M.ObjectId();
    final data =
        Stationary(id: _id, item: item, cost: cost, userId: widget.userId);
    var result = await MongoDatabaseStationary().insert(data.toJson());
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
    itemController.text = "";
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
                      controller: itemController,
                      decoration: InputDecoration(
                        labelText: "Item",
                        hintText: "Enter your Item",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Item";
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
                            itemController.text,
                            costController.text,
                          );
                          await _updateData(_id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  HomeScreen(userId: widget.userId)),
                            ),
                          );
                        },
                        child: Text(
                          "Add Stationary Product",
                          textAlign: TextAlign.center,
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
