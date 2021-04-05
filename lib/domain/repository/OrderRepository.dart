import 'package:bussiness_notebook/domain/models/Order.dart';

abstract class OrderRepository{
  Future<Order> getById(int id);

  Future<List<Order>> getOrders();

  Future<void> save(Order order);

  Future<void> update(int id, Order order);

  Future<void> delete(Order order);
}