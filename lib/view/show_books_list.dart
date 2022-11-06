import 'dart:developer';

import 'package:dbms_project/db_helper/mongodb_book.dart';
import 'package:dbms_project/model/books.dart';
import 'package:dbms_project/view/display_data.dart';
import 'package:flutter/material.dart';
import 'package:dbms_project/db_helper/mongodb.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBooksList extends StatefulWidget {
  ShowBooksList({Key? key,}) : super(key: key);

  @override
  State<ShowBooksList> createState() => _ShowBooksListState();
}

class _ShowBooksListState extends State<ShowBooksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: MongoDatabaseBook().getData(),
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
                                userId: snapshot.data[index].userId,
                              ),
                            ),
                          );
                        },
                        child: displayCard(
                          Book.fromJson(
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

  Widget displayCard(Book data) {
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
              "Name of Book: " + data.name,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Author: " + data.author,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Edition: " + data.edition,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Publication: " + data.publication,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Cost: " + data.cost,
            ),
          ],
        ),
      ),
    );
  }
}
