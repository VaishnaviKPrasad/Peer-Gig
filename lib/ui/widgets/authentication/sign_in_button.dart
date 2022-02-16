import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInButton extends StatelessWidget {
  final String? txt;
  const SignInButton(String s, {Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(FontAwesomeIcons.google),
        label: Text(txt!,
            style: GoogleFonts.mallanna(
              color: AppColors.primaryDark,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
        style: ElevatedButton.styleFrom(
            primary: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )));
  }
}
