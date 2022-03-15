import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/authentication/sign_in_button.dart';
import '../../widgets/authentication/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/';
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/peergig_logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 60.0,
            ),
            SignInButton(
                txt: "SignIn/SignUp with Google Account", cxt: context),
          ],
        ),
      ),
    );
  }
}
