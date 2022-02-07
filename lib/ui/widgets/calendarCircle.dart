// ignore_for_file: unused_local_variable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants/colors.dart';

class CalendarCircle extends StatelessWidget implements PreferredSizeWidget{
  final String? txt;
  const CalendarCircle({Key? key , this.txt,}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryDark!,
          width:1.0
        ),
      child: Text( 
        txt!,
        style: GoogleFonts.mallanna(
          color: AppColors.primaryDark,
          fontSize: 24
        )
      )
    );
  }
}