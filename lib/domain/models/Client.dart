import 'package:bussiness_notebook/domain/models/BaseModel.dart';
import 'package:flutter/cupertino.dart';

class Client{
  int id;
  String name;
  String phone;
  String birthDate;

  Client({this.id,this.name,this.phone,this.birthDate});

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
      id : json['id'],
      name: json['name'],
      phone: json['phone'],
      birthDate: json['birthDate']
  );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['birthDate'] = this.birthDate;
    return data;
  }

  @override
  Client fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name,
    "phone": this.phone,
    "birthDate": this.birthDate,
  };

}
