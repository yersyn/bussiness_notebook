
import 'package:bussiness_notebook/domain/models/Client.dart';

abstract class ClientRepository{

  Future<Client> getById(String id);

  Future<List<Client>> getClients(String userId);

  Future<void> save(Client client);

  Future<void> update(String id, Client client);

  Future<void> delete(Client client);

}