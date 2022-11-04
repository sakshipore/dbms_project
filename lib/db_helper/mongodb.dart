import 'dart:developer';

import 'package:dbms_project/db_helper/constants.dart';
import 'package:dbms_project/model/mongodb_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static late Db db;
  static late DbCollection dataCollection;
  connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
      dataCollection = db.collection(COLL_NAME);
      log(dataCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  static delete(MongoDBModel user) async {
    await dataCollection.remove(where.id(user.id));
  }

  static Future<String> insert(MongoDBModel data) async {
    try {
      dataCollection = db.collection(COLL_NAME);
      var result = await dataCollection.insertOne(data.toJson());
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
    final arrData = await dataCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }

  static Future<Map<String, dynamic>?> checkUser(String mobNo) async {
    Map<String, dynamic>? userData;
    userData = await dataCollection.findOne({'mobNo': mobNo});
    if (userData == null) {
      return null;
    } else {
      log(userData.toString());
      return userData;
    }
  }
}
