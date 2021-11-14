import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class Store {
  static Database? _db;

  static init() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + '/dataBase.db';
      _db = await openDatabase(_path, version: 1, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Experiments (experiments TEXT); ");
  }

  static Future<List<Map>> get() async {
    return jsonDecode((await _db!.query("experiments"))[0]["experiments"]);
  }

  static Future<void> add(Map experiment) async {

  }

}