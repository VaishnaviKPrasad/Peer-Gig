import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInButton extends StatelessWidget {
  final String? txt;
  const SignInButton(String s, {Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 14),
        ),
        onPressed: () {},
        child: Wrap(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center),
          const Icon(FontAwesomeIcons.google),
          Text(
            txt!,
            style: GoogleFonts.mallanna(
              color: AppColors.primaryDark,
              backgroundColor: AppColors.primaryLight,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ]));
  }
}
