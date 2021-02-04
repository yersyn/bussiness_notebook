import 'package:bussiness_notebook/data/configuration/db_provider.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/data/repository/local/dao/ClientDao.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ClientDao)
class ClientDaoImpl extends ClientDao{
  final DBProvider _dbProvider  = DBProvider.db;
  final tableName = "client";

  @override
  Future<void> delete(Client client) async{
    final db = await _dbProvider.database;
    db.delete(this.tableName, where: "id = ?", whereArgs: [client.id]);
  }

  @override
  Future<Client> get(int id) async{
    final db = await _dbProvider.database;
    var res = await  db.query(this.tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : Null;
  }

  @override
  Future<List<Client>> getAll() async{
    print(this.tableName);
    final db = await _dbProvider.database;
    var res = await db.query(this.tableName);
    List<Client> list =  res.isNotEmpty ? res.map((e) => Client.fromMap(e)).toList():[];
    print(list);
    return list;
  }

  @override
  Future<void> save(Client client) async{
    final db = await _dbProvider.database;
    var result = await db.insert(this.tableName, client.toMap());
  }

  @override
  Future<void> update(Client client) async {
    final db = await _dbProvider.database;
    await db.update(
      this.tableName,
      client.toMap(),
      where: "id = ?",
      whereArgs: [client.id],
    );
  }



}