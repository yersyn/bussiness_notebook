import 'package:bussiness_notebook/configureDependencies.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/presentation/bloc/client_form/client_form_bloc.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListBloc.dart';
import 'package:bussiness_notebook/presentation/bloc/client_list/ClientListEvent.dart';
import 'package:bussiness_notebook/presentation/ui/shared/ErrorWidget.dart';
import 'package:bussiness_notebook/presentation/ui/shared/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ClientFormScreen extends StatefulWidget {
  final int clientId;

  ClientFormScreen(this.clientId);

  @override
  _ClientFormScreenState createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends State<ClientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientFormBloc _clientFormBloc = getIt.get<ClientFormBloc>();
   ClientListBloc clientListBloc;
  Client _client;
  TextEditingController birthDateC;

  @override
  void initState() {
    super.initState();

    Client client = Client();

    if(widget.clientId!=0){
      client.id = widget.clientId;
    }

    print("client.id");
    print(client.id);
    _clientFormBloc.add(GetClient(client));
  }

  @override
  Widget build(BuildContext context) {
    clientListBloc = BlocProvider.of<ClientListBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        _clientFormBloc.add(BackEvent());
        return true;
      },
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(title: Text("INFORMACION DEL CLIENTE")),
          body: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                child: BlocListener<ClientFormBloc, ClientFormState>(
                  cubit: _clientFormBloc,
                  listenWhen: (previousState, state) {
                    return state is Success;
                  },
                  listener: (context, state) {
                    clientListBloc.add(GetClientList("query"));
                    Navigator.pop(context);
                  },
                  child: BlocBuilder<ClientFormBloc, ClientFormState>(
                    cubit: _clientFormBloc,
                    builder: (context, state) {
                      if (state is Loaded) {
                        _client =
                            state.client?.id == null ? Client() : state.client;
                        birthDateC =
                            new TextEditingController(text: _client.birthDate);
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 5.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.account_box,
                                        color: Colors.green),
                                    hintText: 'Nombres y Apellidos',
                                    labelText: 'Nombres',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Ingrese sus nombres";
                                    }
                                    return null;
                                  },
                                  initialValue: _client?.name ?? '',
                                  onChanged: (val) {
                                    _client.name = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 5.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.phone_android,
                                        color: Colors.green),
                                    hintText: '975652515',
                                    labelText: 'Numero de celular',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Ingrese su Número de celular";
                                    }
                                    return null;
                                  },
                                  initialValue: _client?.phone,
                                  onChanged: (val) {
                                    _client.phone = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 5.0),
                                child: TextFormField(
                                  // obscureText: true,
                                  key: UniqueKey(),
                                  keyboardType: TextInputType.datetime,
                                  showCursor: true,
                                  readOnly: true,
                                  controller: birthDateC,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.date_range_outlined,
                                          color: Colors.green),
                                      labelText: "Fecha de Nacimiento"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Ingrese su Fecha de nacimiento";
                                    }
                                    return null;
                                  },
                                  // initialValue: _client?.birthDate,
                                  onTap: () {
                                    _datePresent();
                                  },
                                  // onChanged: (val) {
                                  //   _client.birthDate = val;
                                  // },
                                ),
                              ),
                              RaisedButton(
                                child: Container(
                                  child: Text("Registrar"),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 80.0, vertical: 5.0),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                onPressed: () {
                                  _clientFormBloc.add(_client?.id == null
                                      ? RegisterClient(_client)
                                      : UpdateClient(_client));
                                },
                              )
                            ],
                          ),
                        );
                      }

                      if (state is Error) {
                        return error(state.errorMessage);
                      }

                      return loading();
                    },
                  ),
                ),
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {

    _clientFormBloc.close();
    super.dispose();
  }

  void _datePresent() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    ).then((value) {
      birthDateC.text = DateFormat.yMEd().format(value);
      _client.birthDate = birthDateC.text;
    });
  }
}
