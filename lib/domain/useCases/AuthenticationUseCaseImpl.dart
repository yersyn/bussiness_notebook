import 'package:bussiness_notebook/domain/repository/AuthenticationRepository.dart';
import 'package:bussiness_notebook/domain/useCases/AuthenticationUseCase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationUseCase)
class AuthenticationUseCaseImpl implements AuthenticationUseCase{

  AuthenticationRepository _authenticationRepository;

  AuthenticationUseCaseImpl(this._authenticationRepository);


  @override
  logOut() {
    return;
  }

  @override
  Future<bool> login() {
    return this._authenticationRepository.signIn();
  }

}