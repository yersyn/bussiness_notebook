import 'package:bussiness_notebook/data/repository/local/dao/ClientDao.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/domain/repository/ClientRepository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository{

  ClientDao _clientDao;
  ClientRepositoryImpl(this._clientDao){
  }

  @override
  Future<Client> getById(int id) {
    return this._clientDao.get(id);
  }

  @override
  Future<List<Client>> getClients() {
    print("PASOOOOO POR REPOSITORY");
    return this._clientDao.getAll();
  }

  @override
  Future<void> save(Client client) {
    this._clientDao.save(client);
  }

  @override
  Future<void> update(int id, Client client) {
    client.id = id;
    this._clientDao.update(client);
  }

  @override
  Future<void> delete(Client client) {
    this._clientDao.delete(client);
  }



}