import 'package:bussiness_notebook/data/repository/local/dao/PreferenceDao.dart';
import 'package:bussiness_notebook/domain/models/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceDaoImpl implements PreferenceDao{
  static const String _themeIndexKey = "themeIndex";

  @override
  Future<Theme> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_themeIndexKey);

    if(index!= null){
      return Theme.values[index];
    }

    return null;
  }

  @override
  Future<void> setTheme(Theme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeIndexKey, theme.index);
  }

}