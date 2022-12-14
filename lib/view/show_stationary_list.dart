import 'dart:developer';

import 'package:dbms_project/view/display_data.dart';
import 'package:flutter/material.dart';
import 'package:dbms_project/db_helper/mongodb_stationary.dart';
import 'package:dbms_project/model/stationary.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowStationaryList extends StatefulWidget {
  const ShowStationaryList({Key? key}) : super(key: key);

  @override
  State<ShowStationaryList> createState() => _ShowStationaryListState();
}

class _ShowStationaryListState extends State<ShowStationaryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Products Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FutureBuilder(
                  future: MongoDatabaseStationary().getData(),
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
                          shrinkWrap: true,
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
                                Stationary.fromJson(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayCard(Stationary data) {
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
              "Name of Product: " + data.item,
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
