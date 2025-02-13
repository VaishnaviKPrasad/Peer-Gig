import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peer_gig/domain/entities/authentication/auth_user_details.dart';
import 'package:peer_gig/domain/repositories/authentication/auth_repository_base.dart';
import 'package:peer_gig/utils/app_utils.dart';
import 'package:peer_gig/utils/exceptions.dart';
import 'package:peer_gig/utils/secrets.dart';

class AuthRepository extends AuthRepositoryBase {
  @override
  Future<AuthUserDetails> authenticateWithGoogle() async {
    try {
      final GoogleSignInAccount? _userGoogleAccount =
          await GoogleSignIn(scopes: ['https://mail.google.com/']).signIn();

      if (_userGoogleAccount != null &&
          _userGoogleAccount.email.endsWith('@banasthali.in')) {
        GoogleSignInAuthentication _auth =
            await _userGoogleAccount.authentication;

        print("######## AUTH ID TOKEN: ${_auth.idToken}");
        print("######## AUTH access TOKEN: ${_auth.accessToken}");

        Secret.ACCESS_TOKEN = _auth.accessToken;
        Secret.ANDROID_CLIENT_ID = _auth.idToken ?? "";

        print("###### Secret ACCESS TOKEN : ${Secret.ACCESS_TOKEN}");
        print("###### Secret Client ID TOKEN : ${Secret.ANDROID_CLIENT_ID}");

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

  @override
  Future<void> signOut() async {
    GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }

  @override
  String? getEmailOfUser() {
    return FirebaseAuth.instance.currentUser?.email;
  }
}
