import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peer_gig/domain/entities/authentication/auth_user_details.dart';
import 'package:peer_gig/domain/repositories/authentication/auth_repository_base.dart';
import 'package:peer_gig/utils/exceptions.dart';

class AuthRepository extends AuthRepositoryBase {
  @override
  Future<AuthUserDetails> authenticateWithGoogle() async {
    try {
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

        AdditionalUserInfo? _additionalUserInfo =
            _userCredentials.additionalUserInfo;
        return AuthUserDetails(
            email: _userCredentials.user!.email,
            isNewUser: _additionalUserInfo!.isNewUser);
      } // end of if
      else {
        signOut();
        throw InvalidChoiceException(
            errorType: "Invalid Choice Exception",
            errorMsg: "Choose your banasthali account plz.");
      }
    } on PlatformException catch (error) {
      throw UnknownException(errorType: error.code, errorMsg: error.message);
    }
  }

  Future<void> signOut() async {
    GoogleSignIn().disconnect();
  }
}
