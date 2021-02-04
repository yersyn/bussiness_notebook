import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._() {}

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await this.initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    final String path = join(documentsDir.path, 'NoteDB');
    return await openDatabase(path,
        version: 1,
        onOpen: (db) => {},
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE client ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "name TEXT,"
              "phone TEXT,"
              "birthDate TEXT"
              ")");
        });
  }
}
