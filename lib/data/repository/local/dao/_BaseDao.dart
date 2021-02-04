import 'package:bussiness_notebook/domain/models/BaseModel.dart';

abstract class BaseDao<T>{ //Interfaz Dao
  Future<T> get(int id);
  Future<List<T>> getAll();
  Future<void> save(T t);
  Future<void> update(T t);
  Future<void> delete(T t);
}