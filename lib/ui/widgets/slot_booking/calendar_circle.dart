import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class CalendarCircle extends StatelessWidget {
  final bool? disabled;
  final String? txt;
  const CalendarCircle({
    Key? key,
    @required this.txt,
    @required this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //weekday is disabled
    if (disabled!) {
      return Container(
          child: Text(txt!,
              style: GoogleFonts.mallanna(
                  color: AppColors.disabledColor, fontSize: 24)),
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
              color: AppColors.primaryLight, shape: BoxShape.circle));
    }

    return Container(
      child: Text(txt!,
          style:
              GoogleFonts.mallanna(color: AppColors.primaryDark, fontSize: 24)),
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryDark!, width: 1.0),
      ),
    );
  }
}
