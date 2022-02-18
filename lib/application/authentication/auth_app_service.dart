import 'package:flutter/material.dart';
import 'package:peer_gig/data/authentication/auth__repository.dart';
import 'package:peer_gig/domain/entities/authentication/auth_user_details.dart';
import 'package:peer_gig/utils/exceptions.dart';

class AuthAppService {
  Future<void> authenticateWithGoogle(BuildContext context) async {
    try {
      AuthUserDetails _authUserDetails =
          await AuthRepository().authenticateWithGoogle();

      if (_authUserDetails.isNewUser!) {
        // navigate to create new account screen passing the email id
      } else {
        // navigate to the home feed
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
}
