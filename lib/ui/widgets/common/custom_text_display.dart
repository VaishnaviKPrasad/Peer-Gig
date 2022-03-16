import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class CustomTextDisplay extends StatelessWidget {
  final String? txt;
  final bool? isSelector;
  const CustomTextDisplay({
    Key? key,
    @required this.txt,
    @required this.isSelector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: (isSelector == true) ? 160.0 : 100.0,
      child: Padding(
        padding: (isSelector == true)
            ? const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)
            : const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Text(
          txt!,
          style: GoogleFonts.mallanna(
            color: AppColors.primaryDark,
            fontSize: 18,
          ),
          textAlign: (isSelector == true) ? TextAlign.start : TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        border: Border.all(color: AppColors.primaryDark!, width: 1.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}
