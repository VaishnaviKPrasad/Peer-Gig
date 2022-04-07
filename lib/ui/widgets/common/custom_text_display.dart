import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class CustomTextDisplay extends StatelessWidget {
  final String? txt;
  final bool? isSelector;
  final bool? name;
  const CustomTextDisplay({
    Key? key,
    @required this.txt,
    @required this.isSelector,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(name == true) 
    {
      return Container(
        width: MediaQuery.of(context).size.width*0.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Text(
            txt!,
            style: GoogleFonts.mallanna(
              color: AppColors.primaryDark,
              fontSize: 20,
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
    else if(name == false && isSelector == false)
    {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Text(
            txt!,
            style: GoogleFonts.mallanna(
              color: AppColors.primaryDark,
              fontSize: 18,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          border: Border.all(color: AppColors.primaryDark!, width: 2.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );
    }
    else
    {
      return Container(
        width: (isSelector == true) ? 160.0 : 100,
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
}
