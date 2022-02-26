import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class MyAppointmentsTabBar extends StatelessWidget {
  const MyAppointmentsTabBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Text(
          '15 Min Slots',
          style: GoogleFonts.mallanna(
            color: AppColors.primaryLight,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '1 Hr Slot',
          style: GoogleFonts.mallanna(
            color: AppColors.primaryLight,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        )
      ],      
    );
  }
}