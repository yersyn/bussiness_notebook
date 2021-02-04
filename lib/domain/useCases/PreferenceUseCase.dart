

import 'package:bussiness_notebook/domain/models/Theme.dart';

abstract class PreferenceUseCase{

  Future<Theme> getTheme();
  Future<void> setTheme(Theme theme);

}