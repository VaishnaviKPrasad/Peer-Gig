import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textField(txt)
{
  return Container(
    child: Text(
      txt,
      style : GoogleFonts.mallanna(
        color: AppColors.primaryDark,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      )
    ),
    height: 15.0,
    width: 40.0,
    color: AppColors.primaryLight,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1.0,
        color: AppColors.primaryDark!,
      )
    )
  );
}