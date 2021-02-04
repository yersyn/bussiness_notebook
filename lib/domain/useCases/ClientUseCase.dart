import 'package:bussiness_notebook/domain/models/Client.dart';

abstract class ClientUseCase{
  Future<List<Client>> getAllClients();
  Future<Client> getById(int id);
  Future<void> registerClient(Client client);
  Future<void> updateClient(int id, Client client);
  Future<void> deleteClient(Client client);

}