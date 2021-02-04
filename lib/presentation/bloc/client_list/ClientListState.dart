import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:equatable/equatable.dart';

abstract class ClientListState extends Equatable{
}

class InitialClientListState extends ClientListState{
  @override
  List<Object> get props => [];
}

class Loading extends ClientListState{
  @override
  List<Object> get props => [];
}

class Error extends ClientListState {
  final String message;
  Error(this.message);

  @override
  List<Object> get props => [message];
}

class Loaded extends ClientListState {
  final List<Client> clients;
  Loaded(this.clients);

  @override
  List<Object> get props => [clients];
}

