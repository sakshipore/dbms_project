import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb_book.dart';
import 'package:dbms_project/model/books.dart';
import 'package:dbms_project/view/new_user_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:dbms_project/db_helper/mongodb.dart';

class NewBookEntryScreen extends StatefulWidget {
  var userId;
  NewBookEntryScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<NewBookEntryScreen> createState() => _NewBookEntryScreenState();
}

class _NewBookEntryScreenState extends State<NewBookEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  TextEditingController publicationController = TextEditingController();
  bool isLoading = false;
  var _id;

  Future<void> _updateData(var productId) async {
    setState(() {
      isLoading = true;
    });
    var userData = MongoDatabase.fetchUserData(widget.userId);
    var result = await MongoDatabase.update(widget.userId, productId);
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

  Future<void> _insertData(String name, String author, String cost,
      String edition, String publication) async {
    setState(() {
      isLoading = true;
    });
    _id = M.ObjectId();
    final data = Book(
      id: _id,
      name: name,
      author: author,
      cost: cost,
      edition: edition,
      publication: publication,
    );
    var result = await MongoDatabaseBook().insert(data.toJson());
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
    authorController.text = "";
    costController.text = "";
    editionController.text = "";
    publicationController.text = "";
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
                        hintText: "Enter Book Name",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter book name";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: authorController,
                      decoration: InputDecoration(
                        labelText: "Author",
                        hintText: "Enter Author Name",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Author name";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: editionController,
                      decoration: InputDecoration(
                        labelText: "Edition",
                        hintText: "Enter Edition",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Edition";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: publicationController,
                      decoration: InputDecoration(
                        labelText: "Publication",
                        hintText: "Enter Publication",
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter Publication";
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      controller: costController,
                      decoration: InputDecoration(
                        labelText: "Cost",
                        hintText: "Enter Cost",
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
                            authorController.text,
                            costController.text,
                            editionController.text,
                            publicationController.text,
                          );
                          await _updateData(_id);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => NewUserEntryScreen(id: _id),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Add Book Product",
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
