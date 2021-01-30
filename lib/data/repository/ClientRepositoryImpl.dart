import 'package:bussiness_notebook/domain/models/client.dart';
import 'package:bussiness_notebook/domain/repository/ClientRepository.dart';

class ClientRepositoryImpl implements ClientRepository{
  @override
  Future<List<Client>> getClients() {
    // TODO: implement getClients
    throw UnimplementedError();
  }

  @override
  Future<void> save(Client client) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> update(String id, Client client) {
    // TODO: implement update
    throw UnimplementedError();
  }

}