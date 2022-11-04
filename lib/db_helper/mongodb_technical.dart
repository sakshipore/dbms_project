import 'dart:developer';

import 'package:dbms_project/db_helper/constants.dart';
import 'package:dbms_project/model/technical.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseTechnical {
  static late Db db;
  static late DbCollection technicalCollection;
  connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
      technicalCollection = db.collection(TECHNICAL_COLL);
      log(technicalCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String> insert(Technical data) async {
    try {
      technicalCollection = db.collection(TECHNICAL_COLL);
      var result = await technicalCollection.insertOne(data.toJson());
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
    final arrData = await technicalCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }
}
