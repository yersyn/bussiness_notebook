import 'package:bloc/bloc.dart';
import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:bussiness_notebook/domain/useCases/PreferenceUseCase.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceEvent.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceState.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  final PreferenceUseCase _preferenceUseCase;

  PreferenceBloc({@required PreferenceUseCase preferenceUseCase})
      :assert(preferenceUseCase != null),
        _preferenceUseCase = preferenceUseCase,
        super(PreferenceNotLoaded());

  @override
  Stream<PreferenceState> mapEventToState(PreferenceEvent event) async*{
    if(event is LoadPreferences){
      yield* _mapLoadPreferencesToState();
    }else if(event is UpdateTheme){
      yield* _mapUpdateThemeToState(event);
    }
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