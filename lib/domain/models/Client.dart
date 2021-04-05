
class Client{
  String id;
  String user;
  String name;
  String phone;
  String birthDate;

  Client({this.user, this.id,this.name,this.phone,this.birthDate});

  factory Client.fromMap(Map<String, dynamic> json) {
    Client client = new Client(
        id : json['_id'],
        user: json['user'],
        name: json['name'],
        phone: json['phone'],
        birthDate: json['birthDate']
    );

    return client;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['birthDate'] = this.birthDate;
    return data;
  }

  @override
  Client fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toMap() => {
    "_id": this.id,
    "name": this.name,
    "phone": this.phone,
    "birthDate": this.birthDate,
  };

}
