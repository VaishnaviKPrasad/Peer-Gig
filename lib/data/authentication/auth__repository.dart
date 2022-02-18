import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peer_gig/domain/repositories/authentication/auth_repository_base.dart';

class AuthRepository extends AuthRepositoryBase {
  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? _userGoogleAccount =
        await GoogleSignIn().signIn();

    if (_userGoogleAccount != null &&
        _userGoogleAccount.email.endsWith('@banasthali.in')) {
      GoogleSignInAuthentication _auth =
          await _userGoogleAccount.authentication;
      final _credentials = GoogleAuthProvider.credential(
        idToken: _auth.idToken,
        accessToken: _auth.accessToken,
      );

      UserCredential _userCredentials =
          await FirebaseAuth.instance.signInWithCredential(_credentials);

      User? user = _userCredentials.user;
    }
  }

  @override
  Future<void> signUpWithGoogle() async {}
}
