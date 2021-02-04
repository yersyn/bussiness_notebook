
import 'package:bussiness_notebook/domain/models/Client.dart';

abstract class ClientRepository{

  Future<Client> getById(int id);

  Future<List<Client>> getClients();

  Future<void> save(Client client);

  Future<void> update(int id, Client client);

  Future<void> delete(Client client);

}