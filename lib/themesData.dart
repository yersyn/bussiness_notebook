import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:flutter/material.dart' hide Theme;

final Map<Theme, ThemeData> themesData = {

  Theme.light:ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.grey[700],
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.grey[700]),
    )
  ),
  Theme.dark: ThemeData(
    brightness: Brightness.dark
  )

};