import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget
{
  final String? txt;
  const CustomFormField({ Key? key, this.txt }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        txt!,
        style : GoogleFonts.mallanna(
          color: AppColors.primaryDark,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        )
      ),
      height: 15.0,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryLight,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: AppColors.primaryDark!,
        )
      )
    );
  }
}