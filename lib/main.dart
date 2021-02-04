import 'package:bussiness_notebook/configureDependencies.dart';
import 'package:bussiness_notebook/domain/models/Theme.dart';
import 'package:bussiness_notebook/domain/useCases/PreferenceUseCase.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceBloc.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceEvent.dart';
import 'package:bussiness_notebook/presentation/bloc/preference/PreferenceState.dart';
import 'package:bussiness_notebook/presentation/router.dart';
import 'package:bussiness_notebook/presentation/ui/HomeScreen.dart';
import 'package:bussiness_notebook/themesData.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final PreferenceUseCase preferenceUseCase = getIt.get<PreferenceUseCase>();
  final PreferenceBloc preferenceBloc = getIt.get<PreferenceBloc>();

  preferenceBloc
      .firstWhere((state) => state is PreferenceLoaded)
      .then((value) => runApp(App(
            preferenceUseCase: preferenceUseCase,
            preferenceBloc: preferenceBloc,
          )));

  preferenceBloc.add(LoadPreferences());
}

//Widget Client
class App extends StatelessWidget {
  final PreferenceUseCase preferenceUseCase;
  final PreferenceBloc preferenceBloc;

  const App(
      {Key Key,
      @required this.preferenceUseCase,
      @required this.preferenceBloc})
      : assert(preferenceUseCase != null),
        assert(preferenceBloc != null),
        super(key: Key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PreferenceUseCase>.value(value: preferenceUseCase)
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<PreferenceBloc>.value(value: preferenceBloc)
          ],
          child: BlocBuilder<PreferenceBloc, PreferenceState>(
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: state is PreferenceLoaded
                      ? themesData[state.theme]
                      : themesData[Theme.dark],
                  home: MyHomePage(),
                  onGenerateRoute: CustomRouter.generateRoute);
            },
          )),
    );
  }
}
