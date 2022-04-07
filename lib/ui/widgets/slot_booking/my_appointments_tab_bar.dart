import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class MyAppointmentsTabBar extends StatelessWidget with PreferredSizeWidget{
  const MyAppointmentsTabBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.primaryLight,
      indicatorWeight: 3.0,
      tabs: [
        Text(
          '15 Min Slots',
          style: GoogleFonts.mallanna(
            color: AppColors.primaryLight,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '1 Hr Slot',
          style: GoogleFonts.mallanna(
            color: AppColors.primaryLight,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        )
      ],      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+kTextTabBarHeight);
}