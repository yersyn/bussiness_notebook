import 'package:bussiness_notebook/domain/models/theme.dart';

abstract class PreferenceDao{

  Future<void> setTheme(Theme theme);
  Future<Theme> getTheme();

}