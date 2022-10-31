import 'dart:developer';

import 'package:dbms_project/db%20helper/constants.dart';
import 'package:dbms_project/model/mongodb_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, dataCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    dataCollection = db.collection(COLL_NAME);
  }

  static Future<String> insert(MongoDBModel data) async {
    try {
      var result = await dataCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something went wrong";
      }
    } catch (e) {
      print("************************");
      print(e.toString());
      return e.toString();
    }
  }
}
