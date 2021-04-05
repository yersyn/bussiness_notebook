import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/domain/repository/ClientRepository.dart';
import 'package:bussiness_notebook/domain/useCases/ClientUseCase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ClientUseCase)
class ClientUseCaseImpl implements ClientUseCase{
  final ClientRepository _clientRepository;

  ClientUseCaseImpl(this._clientRepository);

  @override
  Future<Client> getById(String id) {
    return this._clientRepository.getById(id);
  }
  
  @override
  Future<List<Client>> getAllClients(String userId) {
    return this._clientRepository.getClients(userId);
  }

  @override
  Future<void> registerClient(Client client) {
    this._clientRepository.save(client);
  }

  @override
  Future<void> updateClient(String id, Client client) {
    this._clientRepository.update(id, client);
  }

  @override
  Future<void> deleteClient(Client client) {
    this._clientRepository.delete(client);
  }



}