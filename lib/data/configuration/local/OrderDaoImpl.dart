// import 'package:bussiness_notebook/data/configuration/db_provider.dart';
// import 'package:bussiness_notebook/data/configuration/local/OrderDao.dart';
// import 'package:bussiness_notebook/domain/models/Order.dart';
//
// class OrderDaoImpl implements OrderDao{
//   final DBProvider _dbProvider  = DBProvider.db;
//   final tableName = "order";
//
//   @override
//   Future<void> save(Order order) async {
//     final db = await _dbProvider.database;
//     var result = await db.insert(this.tableName, order.toMap());
//   }
//
//   @override
//   Future<void> delete(Order order) async{
//     final db = await _dbProvider.database;
//     db.delete(this.tableName, where: "id = ?", whereArgs: [order.id]);
//   }
//
//   @override
//   Future<Order> get(String id) async {
//     final db = await _dbProvider.database;
//     var res = await  db.query(this.tableName, where: "id = ?", whereArgs: [id]);
//     return res.isNotEmpty ? Order.fromMap(res.first) : Null;
//   }
//
//   @override
//   Future<List<Order>> getAll() async{
//     print(this.tableName);
//     final db = await _dbProvider.database;
//     var res = await db.query(this.tableName);
//     List<Order> list =  res.isNotEmpty ? res.map((e) => Order.fromMap(e)).toList():[];
//     print(list);
//     return list;
//   }
//
//   @override
//   Future<void> update(Order order) async{
//     final db = await _dbProvider.database;
//     await db.update(
//       this.tableName,
//       order.toMap(),
//       where: "id = ?",
//       whereArgs: [order.id],
//     );
//   }
//
// }