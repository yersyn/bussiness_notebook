import 'package:bussiness_notebook/domain/models/client.dart';

abstract class ClientUseCase{
  Future<List<Client>> getAllClients();
  Future<Client> registerClient(Client client);
  Future<Client> updateClient(int id, Client client);
  Future<Client> deleteClient(int id);
}