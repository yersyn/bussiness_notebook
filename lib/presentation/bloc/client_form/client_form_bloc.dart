import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/domain/useCases/ClientUseCase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'client_form_event.dart';
part 'client_form_state.dart';

@Injectable()
class ClientFormBloc extends Bloc<ClientFormEvent, ClientFormState> {
  final ClientUseCase clientUseCase;

  ClientFormBloc(this.clientUseCase) : super(ClientFormInitial());

  @override
  Stream<ClientFormState> mapEventToState(ClientFormEvent event) async* {
    yield Loading();
    if (event is GetClient) {
      try {
        print("event.client?.id");
        print(event.client?.id);
        yield Loaded(event.client?.id == null ? Client() : await clientUseCase.getById(event.client?.id));
      } catch(e) {
        yield Error(e.toString());
      }
    } else if (event is BackEvent) {
      yield ClientFormInitial();
    } else if (event is RegisterClient) {
      try {
        await clientUseCase.registerClient(event.client);
        yield Success(event.client.name + ' creado');
      } catch(e) {
        yield Error(e.toString());
      }
    } else if (event is UpdateClient) {
      try {
        await clientUseCase.updateClient( event.client.id, event.client);
        yield Success(event.client.name + ' actualizado');
      } catch(e) {
        yield Error(e.toString());
      }
    }
  }
}
