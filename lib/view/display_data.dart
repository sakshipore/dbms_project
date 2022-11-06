import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb.dart';
import 'package:dbms_project/model/mongodb_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayData extends StatefulWidget {
  var userId;
  DisplayData({Key? key, required this.userId}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: MongoDatabase.fetchUserData(widget.userId),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  log(snapshot.data.toString());
                  return displayData(
                    MongoDBModel.fromJson(
                      snapshot.data,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Data Available",
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget displayData(MongoDBModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.h,
        ),
        Text(
          "User id: " + data.id.$oid,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Name: " + data.fname + " " + data.lname,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Address: " + data.address,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Mobile no.: " + data.mobNo,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
