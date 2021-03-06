import 'dart:async';
import 'dart:io' as io;

import 'package:aharnish_project_task/model/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, dob TEXT, gender TEXT, skills TEXT, phone TEXT, email TEXT, password TEXT)");
  }
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toJson());
    print("result"+res.toString());
    return res;
  }

  // Future<List<User>> userLogin(String email,String password) async {
  //   var dbClient = await db;
  //   List<Map> list = await dbClient.rawQuery('SELECT * FROM User where email="$email" and password="$password"');
  //   List<User> employees = new List();
  //   for (int i = 0; i < list.length; i++) {
  //
  //     employees.add(list[i]);
  //   }
  //   print("empdataslite"+employees.toString());
  //   return employees;
  // }

}