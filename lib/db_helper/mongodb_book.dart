import 'dart:developer';

import 'package:dbms_project/db_helper/constants.dart';
import 'package:dbms_project/model/books.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseBook {
  static late Db db;
  static late DbCollection bookCollection;
  connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
      bookCollection = db.collection(BOOK_COLL);
      log(bookCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String> insert(Book data) async {
    try {
      bookCollection = db.collection(BOOK_COLL);
      var result = await bookCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something went wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await bookCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }
}