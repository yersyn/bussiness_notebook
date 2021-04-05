import 'package:bussiness_notebook/data/configuration/http_manager/app_http_manager.dart';
import 'package:bussiness_notebook/data/configuration/http_manager/http_manager.dart';
import 'package:bussiness_notebook/data/repository/client/ClientDataSource.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ClientDataSource)
class RemoteClientDataSource implements ClientDataSource {
  HttpManager _httpManager;
  final String path = "/clients";

  RemoteClientDataSource(this._httpManager);

  @override
  Future<void> delete(Client client) {
    Map<String, dynamic> query;
    Map<String, dynamic> headers;
    String partialUrl = '$path/${client.id}';

    return _httpManager.delete(url: partialUrl, query: query, headers: headers);
  }

  @override
  Future<Client> getById(String id) async{
    print("BY ID");
    Map<String, dynamic> query = new Map<String, dynamic>();
    Map<String, dynamic> headers = new Map<String, String>();
    String partialUrl = '$path/$id';
    Client client = Client.fromMap(await _httpManager.get(url: partialUrl, query: query, headers: headers));
    print("CLienteeeeeeeeeeeeeee");
    print(client);
    return client;
  }

  @override
  Future<List<Client>> getClientsByUser(String userId) async {
    Map<String, dynamic> query = new Map<String, dynamic>();
    query['userId'] = userId;
    Map<String, String> headers = new Map<String, String>();
    var result = await _httpManager.get(url: path, query: query, headers: headers);
    List<Client> clients = [];
    result.forEach((json)=>clients.add(Client.fromMap(json)));

    return clients;
  }

  @override
  Future<void> save(Client client) async {
    Map<String, dynamic> query;
    Map<String, dynamic> headers;
    Map<String, dynamic> body = client.toJson();

    return await _httpManager.post(url: path,headers: headers, query: query, body: body);
  }

  @override
  Future<void> update(Client client) async {
    Map<String, dynamic> query;
    Map<String, dynamic> headers;
    Map<String, dynamic> body = client.toJson();
    String partialUrl = '$path/${client.id}';

    return await _httpManager.put(url: partialUrl,headers: headers, query: query, body: body);
  }
}
