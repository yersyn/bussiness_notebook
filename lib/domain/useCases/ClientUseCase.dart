import 'package:bussiness_notebook/domain/models/Client.dart';

abstract class ClientUseCase{
  Future<List<Client>> getAllClients(String userId);
  Future<Client> getById(String id);
  Future<void> registerClient(Client client);
  Future<void> updateClient(String id, Client client);
  Future<void> deleteClient(Client client);

}