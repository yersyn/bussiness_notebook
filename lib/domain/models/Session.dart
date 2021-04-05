import 'package:bussiness_notebook/domain/models/User.dart';

class Session{
  String id;
  User user;
  DateTime lastSession;
  String token;

  Session({this.id, this.user, this.lastSession, this.token});

}