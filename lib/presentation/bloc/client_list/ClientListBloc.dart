import 'package:bloc/bloc.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/domain/useCases/ClientUseCase.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListEvent.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListState.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ClientListBloc extends Bloc<ClientListEvent, ClientListState>{
  final ClientUseCase clientUseCase;

  ClientListBloc(this.clientUseCase) : super(InitialClientListState());

  @override
  Stream<ClientListState> mapEventToState(ClientListEvent event) async*{
    print("Pasando Loading");
    yield Loading();

    if(event is GetClientList){
      try {
        print("EN BLOC");
        List<Client> clients = await clientUseCase.getAllClients('userId');
        yield Loaded(clients);
      } catch(e) {
        yield Error(e.toString());
      }
    }else if(event is DeleteClientEvent){
      try {
        await clientUseCase.deleteClient(event.client);
        yield Loaded(await clientUseCase.getAllClients(''));
      } catch(e) {
        yield Error(e.toString());
      }
    }

  }



}