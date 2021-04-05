// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/configuration/http_manager/app_http_manager.dart';
import 'data/repository/authentication/AuthenticationDataRepository.dart';
import 'data/repository/authentication/AuthenticationDataSource.dart';
import 'domain/repository/AuthenticationRepository.dart';
import 'domain/useCases/AuthenticationUseCase.dart';
import 'domain/useCases/AuthenticationUseCaseImpl.dart';
import 'data/repository/client/ClientDataSource.dart';
import 'presentation/bloc/client_form/client_form_bloc.dart';
import 'presentation/bloc/client_list/ClientListBloc.dart';
import 'domain/repository/ClientRepository.dart';
import 'data/repository/client/ClientDataRepository.dart';
import 'domain/useCases/ClientUseCase.dart';
import 'domain/useCases/ClientUseCaseImpl.dart';
import 'data/repository/authentication/GoogleAuthenticationDataSource.dart';
import 'data/configuration/http_manager/http_manager.dart';
import 'presentation/bloc/preference/PreferenceBloc.dart';
import 'data/configuration/local/PreferenceDao.dart';
import 'data/configuration/local/PreferenceDaoImpl.dart';
import 'domain/repository/PreferenceRepository.dart';
import 'data/repository/theme/ThemeRepositoryImpl.dart';
import 'domain/useCases/PreferenceUseCase.dart';
import 'domain/useCases/PreferenceUseCaseImpl.dart';
import 'data/repository/client/RemoteClientDataSource.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<AuthenticationUseCase>(
      () => AuthenticationUseCaseImpl(get<AuthenticationRepository>()));
  gh.factory<HttpManager>(() => AppHttpManager());
  gh.factory<PreferenceUseCase>(() =>
      PreferenceUseCaseImpl(preferenceRepository: get<PreferenceRepository>()));
  gh.factory<ClientDataSource>(
      () => RemoteClientDataSource(get<HttpManager>()));
  gh.factory<ClientUseCase>(() => ClientUseCaseImpl(get<ClientRepository>()));
  gh.factory<PreferenceBloc>(
      () => PreferenceBloc(preferenceUseCase: get<PreferenceUseCase>()));
  gh.factory<ClientFormBloc>(() => ClientFormBloc(get<ClientUseCase>()));
  gh.factory<ClientListBloc>(() => ClientListBloc(get<ClientUseCase>()));

  // Eager singletons must be registered in the right order
  gh.singleton<AuthenticationDataSource>(GoogleAuthenticationDataSource());
  gh.singleton<AuthenticationRepository>(
      AuthenticationDataRepository(get<AuthenticationDataRepository>()));
  gh.singleton<PreferenceDao>(PreferenceDaoImpl());
  gh.singleton<PreferenceRepository>(
      PreferenceRepositoryImpl(get<PreferenceDao>()));
  gh.singleton<ClientRepository>(ClientRepositoryImpl(get<ClientDataSource>()));
  return get;
}
