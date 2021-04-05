import 'package:bussiness_notebook/domain/repository/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthenticationRepository)
class AuthenticationDataRepository implements AuthenticationRepository{

  AuthenticationDataRepository _authenticationDataRepository;
  AuthenticationDataRepository(this._authenticationDataRepository);

  @override
  signIn() {
    return this._authenticationRepository.signIn();
  }

  @override
  signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}