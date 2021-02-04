import 'package:bussiness_notebook/data/repository/local/dao/_BaseDao.dart';
import 'package:bussiness_notebook/data/configuration/db_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bussiness_notebook/domain/models/BaseModel.dart';

//Only experiment...
class CommonDao<T extends BaseModel> implements BaseDao<T>{
  final DBProvider _dbProvider  = DBProvider.db;
  final String tableName;
  final BaseModel instance;

  CommonDao(this.instance, {@required this.tableName});

  @override
  Future<T> get(int id) async{
    final db = await _dbProvider.database;
    var res = await  db.query(this.tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? res.first : Null;
  }

  @override
  Future<List<T>> getAll() async {
    print("EN DAOO");
    print(this.tableName);
    final db = await _dbProvider.database;
    var res = await db.query(this.tableName);
    List<T> list =
    res.isNotEmpty ? res.toList() : [];
    return list;
  }

  @override
  Future<void> save(T t) async {
    final db = await _dbProvider.database;
    var result = db.insert(this.tableName, instance.toJson());
  }

  @override
  Future<void> update(T t) async{
    final db = await _dbProvider.database;
    await db.update(
      this.tableName,
      t.toJson(),
      where: "id = ?",
      whereArgs: [t.id],
    );
  }

  @override
  Future<void> delete(T t) async{
    Database db = await _dbProvider.database;
    await db.delete(this.tableName, where: "id = ?", whereArgs: [t.id]);
  }


}