import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  final String? txt;
  const SignInButton(String s, {Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset('assets/images/google_logo.png'),
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
