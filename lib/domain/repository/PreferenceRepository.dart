import 'package:bussiness_notebook/domain/models/theme.dart';


abstract class PreferenceRepository{

  Future<Theme> getTheme();
  Future<void> setTheme(Theme theme);

}