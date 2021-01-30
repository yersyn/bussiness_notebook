import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class DBProvider{
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._(){}

  Future<Database> get database async{
    if(_database!=null){
      return database;
    }

    _database = this.initDB();
    return _database;
  }

  initDB() async{
    Directory documentsDir = await getApplicationDocumentsDirectory();
    final path = join(documentsDir.path, 'dbNote');
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) => {},
        // onCreate: (db, version) => {}
        );
  }

}