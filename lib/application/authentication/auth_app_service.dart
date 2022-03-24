import 'package:flutter/material.dart';
import 'package:peer_gig/data/authentication/auth_repository.dart';
import 'package:peer_gig/domain/entities/authentication/auth_user_details.dart';
import 'package:peer_gig/ui/screens/authentication/create_account_screen.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';
import 'package:peer_gig/ui/screens/common/root_screen.dart';
import 'package:peer_gig/utils/exceptions.dart';

class AuthAppService {
  Future<void> authenticateWithGoogle(BuildContext context) async {
    try {
      AuthUserDetails _authUserDetails =
          await AuthRepository().authenticateWithGoogle();

      if (_authUserDetails.isNewUser!) {
        Navigator.of(context).pushReplacementNamed(
            CreateAccountScreen.routeName,
            arguments: _authUserDetails.email);
      } else {
        Navigator.of(context).pushReplacementNamed(RootScreen.routeName);
      }
    } on InvalidChoiceException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.getMessage(),
          ),
        ),
      );
    } on UnknownException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.getMessage(),
          ),
        ),
      );
    }
  }

  String? getEmailOfUser() {
    return AuthRepository().getEmailOfUser();
  }
}
