import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'parameters.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String PARAd = 'D';
  static const String PARAe = 'E';
  static const String PARAg = 'G';
  static const String PARAh = 'H';
  static const String PARAi = 'I';
  static const String PARAj = 'J';
  static const String PARAk = 'K';
  static const String PARAl = 'L';
  static const String PARAo = 'O';
  static const String PARAp = 'P';
  static const String PARAq = 'Q';
  static const String TABLE = 'Parameter';
  static const String DB_NAME = 'parameter0.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $PARAd TEXT, $PARAe TEXT, $PARAg TEXT, $PARAh TEXT, $PARAi TEXT, $PARAj TEXT, $PARAk TEXT, $PARAl TEXT, $PARAo TEXT, $PARAp TEXT, $PARAq TEXT)");
  }

  Future<Parameters> save(Parameters parameters) async {
    var dbClient = await db;
    parameters.id = await dbClient.insert(TABLE, parameters.toMap());
    return parameters;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<List<Parameters>> getParameters() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, PARAd, PARAe, PARAg, PARAh,PARAi,PARAj,PARAk,PARAl,PARAo,PARAp,PARAq]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Parameters> parameter = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        parameter.add(Parameters.fromMap(maps[i]));
      }
    }
    return parameter;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(Parameters parameters) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, parameters.toMap(),
        where: '$ID = ?', whereArgs: [parameters.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
