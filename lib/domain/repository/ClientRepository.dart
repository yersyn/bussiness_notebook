
import 'package:bussiness_notebook/domain/models/client.dart';

abstract class ClientRepository{

  Future<List<Client>> getClients();

  Future<void> save(Client client);

  Future<void> update(String id, Client client);

}