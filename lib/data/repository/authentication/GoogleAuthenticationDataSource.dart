import 'package:bussiness_notebook/data/repository/authentication/AuthenticationDataSource.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthenticationDataSource)
class GoogleAuthenticationDataSource extends AuthenticationDataSource{

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<bool> login() async{
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    print('signInWithGoogle succeeded: ${googleSignInAuthentication.accessToken} ${googleSignInAuthentication.idToken}');

    return true;
  }

  @override
  logout() {

  }

}