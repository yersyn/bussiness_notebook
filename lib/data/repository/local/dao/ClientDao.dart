import 'package:bussiness_notebook/domain/models/client.dart';

abstract class ClientDao{
  Future<Client> get(int id);
  Future<Client> insert(Client client);
  Future<Client> update(int id, Client client);
  Future<bool> delete(int id);
}