import 'dart:developer';

import 'package:dbms_project/model/technical.dart';
import 'package:dbms_project/view/display_data.dart';
import 'package:flutter/material.dart';
import 'package:dbms_project/db_helper/mongodb_technical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowTechnicalList extends StatefulWidget {
  const ShowTechnicalList({Key? key}) : super(key: key);

  @override
  State<ShowTechnicalList> createState() => _ShowTechnicalListState();
}

class _ShowTechnicalListState extends State<ShowTechnicalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: MongoDatabaseTechnical().getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  int totalData = snapshot.data.length;
                  log("Total Data: $totalData");
                  log(snapshot.data.toString());
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayData(
                                userId: snapshot.data[index]["userId"],
                              ),
                            ),
                          );
                        },
                        child: displayCard(
                          Technical.fromJson(
                            snapshot.data[index],
                          ),
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

  Widget displayCard(Technical data) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product id: " + data.id.$oid,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Name of Product: " + data.name,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Company Name: " + data.companyName,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Model no.: " + data.modelNo,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Specification: " + data.specification,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Bill no.: " + data.billNo,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Cost: " + data.cost,
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
