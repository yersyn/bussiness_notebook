import 'package:bussiness_notebook/presentation/ui/HomePage.dart';
import 'package:flutter/material.dart';

class CustomRouter{
  static Route<dynamic>generateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case 'clients':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case 'orders':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }


}