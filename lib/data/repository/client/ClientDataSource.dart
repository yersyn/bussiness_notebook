import 'package:bussiness_notebook/domain/models/Client.dart';

abstract class ClientDataSource {
  Future<Client> getById(String id);
  Future<List<Client>> getClientsByUser(String userId);
  Future<void> save(Client client);
  Future<void> update(Client client);
  Future<void> delete(Client client);
}