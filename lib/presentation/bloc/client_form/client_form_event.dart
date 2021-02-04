part of 'client_form_bloc.dart';

abstract class ClientFormEvent extends Equatable {}

class BackEvent extends ClientFormEvent{
  @override
  List<Object> get props => [];
}

class GetClient extends ClientFormEvent{
  final Client client;

  GetClient(this.client);

  @override
  List<Object> get props => [this.client];

}

class RegisterClient extends ClientFormEvent{
  final Client client;

  RegisterClient(this.client);

  @override
  List<Object> get props => [this.client];
}

class UpdateClient extends ClientFormEvent{
  final Client client;

  UpdateClient(this.client);

  @override
  List<Object> get props => [this.client];
}




