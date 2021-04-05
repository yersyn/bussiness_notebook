class User{

  String id;
  String name;
  String surname;
  String photo;

  User({this.id, this.name, this.surname, this.photo});


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['photo'] = this.photo;
    return data;
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    surname = json['surname'];
    photo = json['photo'];
  }

  Map<String, dynamic> toMap() => {
    "_id": this.id,
    "name": this.name,
    "surname": this.surname,
    "photo": this.photo,
  };
}