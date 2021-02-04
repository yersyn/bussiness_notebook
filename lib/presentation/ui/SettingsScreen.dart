import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Card(child: ListTile(
            title: Text("Tema"),
            subtitle: Text("Cambia de Tema"),
            onTap: (){
              Navigator.pushNamed(context, "themes");
            },
          )),
          Card()
        ],
      ),
    );
  }
}
