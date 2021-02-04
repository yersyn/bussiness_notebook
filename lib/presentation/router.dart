import 'package:bussiness_notebook/presentation/ui/ClientFormScreen.dart';
import 'package:bussiness_notebook/presentation/ui/ClientsScreen.dart';
import 'package:bussiness_notebook/presentation/ui/HomeScreen.dart';
import 'package:bussiness_notebook/presentation/ui/SettingsScreen.dart';
import 'package:bussiness_notebook/presentation/ui/widgets/ThemeSelector.dart';
import 'package:flutter/material.dart';

class CustomRouter{
  static Route<dynamic>generateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case 'themes':
        return MaterialPageRoute(builder: (_) => ThemeSelectorPage());
      case 'settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case 'clients':
        return MaterialPageRoute(builder: (_) => ClientsPage());
      case 'clientForm':
        return MaterialPageRoute(builder: (_) => ClientFormScreen(null));
      case 'orders':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('La opción todavia no está implementada ${settings.name}'),
              ),
            ));
    }
  }


}