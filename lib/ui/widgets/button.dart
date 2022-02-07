import '../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget pgButton(txt)
{
    return ElevatedButton(
      onPressed: () {}, 
      child: Text(txt, 
        style: GoogleFonts.mallanna(
          color : AppColors.primaryDark,
          backgroundColor : AppColors.primaryLight,
          fontSize : 12,
          fontWeight : FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
}
