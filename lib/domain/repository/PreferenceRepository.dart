import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:injectable/injectable.dart';


abstract class PreferenceRepository{

  Future<Theme> getTheme();
  Future<void> setTheme(Theme theme);

}