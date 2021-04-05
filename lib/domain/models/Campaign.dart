import 'package:bussiness_notebook/domain/models/BaseModel.dart';
import 'package:flutter/cupertino.dart';

class Campaign{
  int id;
  String name;
  DateTime start;
  DateTime end;

  Campaign({this.id,this.name,this.start,this.end});

  factory Campaign.fromMap(Map<String, dynamic> json) => new Campaign(
      id : json['id'],
      name: json['name'],
      start: json['start'],
      end: json['end']
  );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }

  @override
  Campaign fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name,
    "start": this.start,
    "end": this.end,
  };



}
