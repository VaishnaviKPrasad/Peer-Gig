import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class TextDisplay extends StatelessWidget {
  final String? txt;
  const TextDisplay({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryLight,
        height: 12.0,
        width: 40.0,
        child: Text(txt!,
            style: GoogleFonts.mallanna(
                color: AppColors.primaryDark, fontSize: 18)),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryDark!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15))));
  }
}
