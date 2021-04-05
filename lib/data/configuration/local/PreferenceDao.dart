

import 'package:bussiness_notebook/domain/models/Theme.dart';

abstract class PreferenceDao{

  Future<void> setTheme(Theme theme);
  Future<Theme> getTheme();

}