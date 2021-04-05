import 'package:bussiness_notebook/domain/models/Brand.dart';
import 'package:bussiness_notebook/domain/models/Campaign.dart';
import 'package:bussiness_notebook/domain/models/Client.dart';
import 'package:bussiness_notebook/domain/models/OrderDetail.dart';

class Order{
  int id;
  Brand brand;
  Campaign campaign;
  Client client;
  String date;
  List<OrderDetail> orderDetails;
  bool paidOut;
  double totalAmount;


  Order({this.id,this.brand,this.campaign,this.date, this.client, this.orderDetails, this.paidOut, this.totalAmount});

  factory Order.fromMap(Map<String, dynamic> json) => new Order(
      id: json['id'],
      brand: json['brand'],
      campaign: json['campaign'],
      client: json['client'],
      date: json['date'],
      orderDetails: json['orderDetails'],
      paidOut: json['paidOut'],
      totalAmount: json['totalAmount'],
  );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['campaign'] = this.campaign;
    data['client'] = this.client;
    data['date'] = this.date;
    data['orderDetails'] = this.orderDetails;
    data['paidOut'] = this.paidOut;
    data['totalAmount'] = this.totalAmount;
    return data;
  }

  @override
  Order fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    campaign = json['campaign'];
    client = json['client'];
    date = json['date'];
    orderDetails = json['orderDetails'];
    paidOut = json['paidOut'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "brand": this.brand,
    "campaign": this.campaign,
    "client": this.client,
    "date": this.date,
    "orderDetails": this.orderDetails,
    "paidOut": this.paidOut,
    "totalAmount": this.totalAmount,
  };

}
