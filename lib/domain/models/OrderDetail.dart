
class OrderDetail{

  int id;
  String name;
  double price;
  double amount;

  OrderDetail({this.id, this.name, this.price, this.amount});


  factory OrderDetail.fromMap(Map<String, dynamic> json) => new OrderDetail(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      amount: json['amount']
  );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['amount'] = this.amount;

    return data;
  }

  @override
  OrderDetail fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    amount = json['amount'];

  }

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'price': this.price,
    'amount': this.amount,
  };

}