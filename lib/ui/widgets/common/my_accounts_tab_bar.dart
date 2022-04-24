import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class MyAccountTabBar extends StatelessWidget with PreferredSizeWidget {
  const MyAccountTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Text(
          'About',
          style: GoogleFonts.mallanna(
            color: AppColors.primaryLight,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Manage My Slots',
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
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
