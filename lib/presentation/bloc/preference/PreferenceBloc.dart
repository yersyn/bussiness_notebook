import 'package:bloc/bloc.dart';
import 'package:bussiness_notebook/domain/models/theme.dart';
import 'package:bussiness_notebook/domain/useCases/PreferenceUseCase.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceEvent.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceState.dart';
import 'package:flutter/foundation.dart';



class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  final PreferenceUseCase _preferenceUseCase;

  PreferenceBloc({@required PreferenceUseCase preferenceUseCase})
      :assert(_preferenceUseCase != null),
        _preferenceUseCase = preferenceUseCase,d
        super(PreferenceNotLoaded());

  @override
  Stream<PreferenceState> mapEventToState(PreferenceEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  Stream<PreferenceState> _mapLoadPreferencesToState() async*{
    final theme = await _preferenceUseCase.getTheme();

    if(theme==null){
      add(UpdateTheme(Theme.dark));
    }else{
      yield PreferenceLoaded(theme);
    }
  }

  Stream<PreferenceState> _mapUpdateThemeToState(UpdateTheme event) async*{
    _preferenceUseCase.setTheme(event.theme);
    yield PreferenceLoaded(event.theme);
  }


}