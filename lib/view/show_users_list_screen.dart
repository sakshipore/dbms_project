import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb.dart';
import 'package:dbms_project/model/mongodb_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowUsersListScreen extends StatelessWidget {
  const ShowUsersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: MongoDatabase.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  int totalData = snapshot.data.length;
                  log("Total Data: $totalData");
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return displayCard(
                        MongoDBModel.fromJson(
                          snapshot.data[index],
                        ),
                      );
                    },
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

  Widget displayCard(MongoDBModel data) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.id.$oid,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              data.fname,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              data.lname,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              data.address,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              data.mobNo,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              data.product.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
