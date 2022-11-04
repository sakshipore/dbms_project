import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDBModel mongoDBModelfromJson(String str) =>
    MongoDBModel.fromJson(json.decode(str));

String mongoDBModeltoJson(MongoDBModel data) => json.encode(data.toJson());

class MongoDBModel {
  ObjectId id;
  String address;
  String fname;
  String lname;
  String mobNo;

  MongoDBModel({
    required this.id,
    required this.address,
    required this.fname,
    required this.lname,
    required this.mobNo,
  });

  factory MongoDBModel.fromJson(Map<String, dynamic> json) => MongoDBModel(
        id: json["id"],
        address: json["address"],
        fname: json["fname"],
        lname: json["lname"],
        mobNo: json["mobNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "fname": fname,
        "lname": lname,
        "mobNo": mobNo,
      };
}
