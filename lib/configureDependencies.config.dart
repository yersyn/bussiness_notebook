// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/repository/local/dao/ClientDao.dart';
import 'data/repository/local/dao/ClientDaoImpl.dart';
import 'presentation/bloc/client_form/client_form_bloc.dart';
import 'presentation/bloc/client_list/ClientListBloc.dart';
import 'domain/repository/ClientRepository.dart';
import 'data/repository/ClientRepositoryImpl.dart';
import 'domain/useCases/ClientUseCase.dart';
import 'domain/useCases/ClientUseCaseImpl.dart';
import 'presentation/bloc/preference/PreferenceBloc.dart';
import 'data/repository/local/dao/PreferenceDao.dart';
import 'data/repository/local/dao/PreferenceDaoImpl.dart';
import 'domain/repository/PreferenceRepository.dart';
import 'data/repository/ThemeRepositoryImpl.dart';
import 'domain/useCases/PreferenceUseCase.dart';
import 'domain/useCases/PreferenceUseCaseImpl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<ClientUseCase>(() => ClientUseCaseImpl(get<ClientRepository>()));
  gh.factory<PreferenceUseCase>(() =>
      PreferenceUseCaseImpl(preferenceRepository: get<PreferenceRepository>()));
  gh.factory<ClientFormBloc>(() => ClientFormBloc(get<ClientUseCase>()));
  gh.factory<ClientListBloc>(() => ClientListBloc(get<ClientUseCase>()));
  gh.factory<PreferenceBloc>(
      () => PreferenceBloc(preferenceUseCase: get<PreferenceUseCase>()));

  // Eager singletons must be registered in the right order
  gh.singleton<ClientDao>(ClientDaoImpl());
  gh.singleton<ClientRepository>(ClientRepositoryImpl(get<ClientDao>()));
  gh.singleton<PreferenceDao>(PreferenceDaoImpl());
  gh.singleton<PreferenceRepository>(
      PreferenceRepositoryImpl(get<PreferenceDao>()));
  return get;
}
