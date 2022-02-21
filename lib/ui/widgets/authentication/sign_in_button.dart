import 'package:peer_gig/application/authentication/auth_app_service.dart';

import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInButton extends StatelessWidget {
  final String? txt;
  final BuildContext? cxt;
  const SignInButton({Key? key, @required this.txt, @required this.cxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => AuthAppService().authenticateWithGoogle(cxt!),
      icon: const Icon(
        FontAwesomeIcons.google,
        color: Color.fromARGB(255, 179, 148, 36),
      ),
      label: Text(txt!,
          style: GoogleFonts.mallanna(
            color: AppColors.primaryDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
