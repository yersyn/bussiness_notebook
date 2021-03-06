import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:bussiness_notebook/domain/repository/PreferenceRepository.dart';
import 'package:bussiness_notebook/domain/useCases/PreferenceUseCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PreferenceUseCase)
class PreferenceUseCaseImpl extends PreferenceUseCase{
  final PreferenceRepository _preferenceRepository;

  PreferenceUseCaseImpl({@required PreferenceRepository preferenceRepository}):
        assert(preferenceRepository!=null), _preferenceRepository=preferenceRepository;

  @override
  Future<Theme> getTheme() {
    return this._preferenceRepository.getTheme();
  }

  @override
  Future<void> setTheme(Theme theme) {
    return this._preferenceRepository.setTheme(theme);
  }
}