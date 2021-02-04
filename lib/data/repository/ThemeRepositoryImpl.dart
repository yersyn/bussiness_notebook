import 'package:bussiness_notebook/data/repository/local/dao/PreferenceDao.dart';
import 'package:bussiness_notebook/domain/models/Theme.dart';

import 'package:bussiness_notebook/domain/repository/PreferenceRepository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PreferenceRepository)
class PreferenceRepositoryImpl implements PreferenceRepository{
  final PreferenceDao _preferenceDao;

  PreferenceRepositoryImpl(PreferenceDao preferenceDao):_preferenceDao = preferenceDao{

  }

  @override
  Future<Theme> getTheme() {
    return this._preferenceDao.getTheme();
  }

  @override
  Future<void> setTheme(Theme theme) {
    return this._preferenceDao.setTheme(theme);
  }



}