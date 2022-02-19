import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/authentication/sign_in_button.dart';
import '../../config/constants/colors.dart';
import '../../widgets/authentication/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/';
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary!, AppColors.secondary!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.60, 0.1])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/peergig_logo.png',
              width: 200,
              height: 200,
            ),
            SignInButton(
                txt: "SignIn/SignUp with Google Account", cxt: context),
          ],
        ),
      ),
    );
  }
}
