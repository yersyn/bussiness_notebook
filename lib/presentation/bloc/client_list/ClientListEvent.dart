import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:equatable/equatable.dart';

abstract class ClientListEvent extends Equatable {}

class GetClientList extends ClientListEvent {
  final String query;
  GetClientList(this.query);

  @override
  List<Object> get props => [query];
}

class DeleteClientEvent extends ClientListEvent {
  final Client client;
  DeleteClientEvent(this.client);

  @override
  List<Object> get props => [client];
}
