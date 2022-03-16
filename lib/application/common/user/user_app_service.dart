import 'package:flutter/material.dart';
import 'package:peer_gig/data/authentication/auth__repository.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';

class UserAppService {
  static Future<void> addUser(
      Map<String, Object?> inputDetailsByUser, BuildContext context) async {
    print("################# User Details Map $inputDetailsByUser");
    inputDetailsByUser['email'] = AuthRepository().getEmailOfUser();
    inputDetailsByUser.forEach(
      (key, value) {
        if (value == null) {
          inputDetailsByUser[key] = "";
        }
        if (value is List &&
            value
                .any((element) => element.toString().compareTo("Other") == 0)) {
          (inputDetailsByUser[key] as List).remove("Other");
        }
      },
    );
    await UserRepository().addUser(inputDetailsByUser);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
