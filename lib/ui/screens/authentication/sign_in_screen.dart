import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/widgets/authentication/sign_in_button.dart';
import '../../config/constants/colors.dart';
import '../../widgets/authentication/sign_in_button.dart';
import '../../config/constants/peer_gig_icons.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary!, AppColors.secondary!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.60, 0.1])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/peergig_logo'),
              const SignInButton("Log In with Google Account"),
              ListTile(
                  tileColor: AppColors.primaryLight,
                  leading:
                      Icon(PeerGigIcons.about, color: AppColors.primaryDark),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: Text(
                      "You can sign in or sign up using only your Banasthali account",
                      style: GoogleFonts.mallanna(
                          color: AppColors.primaryDark, fontSize: 18)))
            ]));
  }
}
