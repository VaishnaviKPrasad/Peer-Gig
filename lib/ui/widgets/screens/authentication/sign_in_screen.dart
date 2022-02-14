import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/authentication/sign_in_button.dart';
import '../../../config/constants/gradient.dart';
import '../../authentication/sign_in_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: AppScreenGradient,
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
          SignInButton("Log In with Google Account"),
          SignInButton("New User? Create New Account!")
        ])));
  }
}
