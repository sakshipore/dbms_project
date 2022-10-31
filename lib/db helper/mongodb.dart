import 'package:mongo_dart/mongo_dart.dart' as mongo;

class MongoDatabase {
  static const dbUrl =
      'mongodb://117.217.108.189:27017/dbms_project';
  late mongo.Db _db;

  MongoDatabase._() {
    _db = mongo.Db(dbUrl);
  }

  static final instance = MongoDatabase._();

  Future<void> init() async {
    await _db.open();
  }

  Future<List<Map>> findAll(String collectionName) async {
    final collection = _db.collection(collectionName);
    return collection.find().toList();
  }
}
