import 'package:bussiness_notebook/configureDependencies.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListBloc.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListEvent.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListState.dart';
import 'package:bussiness_notebook/presentation/ui/ClientFormScreen.dart';
import 'package:bussiness_notebook/presentation/ui/shared/ErrorWidget.dart';
import 'package:bussiness_notebook/presentation/ui/shared/LoadingWidget.dart';
import 'package:bussiness_notebook/presentation/ui/shared/NoDataWidget.dart';
import 'package:bussiness_notebook/presentation/ui/shared/SnackBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final ClientListBloc clientListBloc = getIt.get<ClientListBloc>();

  ClientsPage(){
    clientListBloc.add(GetClientList("query"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clientes"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder:(ctx){
               return BlocProvider<ClientListBloc>.value(
                   value: clientListBloc,
                   child: ClientFormScreen('0'));
             }));
            }),
        body: Center(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async => clientListBloc.add(GetClientList("query")),
              child: BlocBuilder<ClientListBloc, ClientListState>(
                cubit: clientListBloc,
                builder: (context, state) {
                  if (state is Loaded) {
                    return Container(
                      child: (state.clients.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.clients.length,
                              itemBuilder: (context, index) {
                                Client client = state.clients[index];
                                return _clientCard(client, context);
                              })
                          : NoData()),
                    );
                  }
                  if (state is Error) {
                    return error(state.message);
                  }
                  return loading();
                },

            ),
          ),
        ));
  }

  Dismissible _clientCard(Client client, BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.deepOrange),
      onDismissed: (direction){
        clientListBloc.add(DeleteClientEvent(client));
        _scaffoldKey.currentState
            .showSnackBar(snackBar(client.name + ' eliminado'));
      },
      key: UniqueKey(),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(padding: EdgeInsets.all(10), child: Text(client.name)),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<ClientFormScreen>(
                          builder: (context) {
                            return BlocProvider<ClientListBloc>.value(
                                value: clientListBloc,
                                child: ClientFormScreen(client.id));
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      clientListBloc.add(DeleteClientEvent(client));
                      _scaffoldKey.currentState
                          .showSnackBar(snackBar(client.name + ' deleted'));
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
