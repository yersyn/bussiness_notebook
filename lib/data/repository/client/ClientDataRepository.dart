import 'package:bussiness_notebook/data/repository/client/ClientDataSource.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/domain/repository/ClientRepository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository{

  ClientDataSource _clientDataSource;
  ClientRepositoryImpl(this._clientDataSource);

  @override
  Future<Client> getById(String id) {
    return this._clientDataSource.getById(id);
  }

  @override
  Future<List<Client>> getClients(String userId) {
    print("PASOOOOO POR REPOSITORY");
    return this._clientDataSource.getClientsByUser(userId);
  }

  @override
  Future<void> save(Client client) {
    return this._clientDataSource.save(client);
  }

  @override
  Future<void> update(String id, Client client) {
    client.id = id;
    return this._clientDataSource.update(client);
  }

  @override
  Future<void> delete(Client client) {
    return this._clientDataSource.delete(client);
  }



}