part of 'client_form_bloc.dart';

abstract class ClientFormState extends Equatable {
  const ClientFormState();
}

class ClientFormInitial extends ClientFormState {
  @override
  List<Object> get props => [];
}

class Loading extends ClientFormState {
  @override
  List<Object> get props => [];
}

class Error extends ClientFormState {
  final String errorMessage;
  Error(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}

class Loaded extends ClientFormState {
  final Client client;
  Loaded(this.client);

  @override
  List<Object> get props => [this.client];
}

class Success extends ClientFormState {
  final String successMessage;
  Success(this.successMessage);

  @override
  List<Object> get props => [this.successMessage];
}
