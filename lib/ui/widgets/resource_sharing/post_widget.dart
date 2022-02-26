import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class PostWidget extends StatelessWidget {
  final String? txt;
  const PostWidget({
    Key? key,
    @required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 300.0,
      child: Text(
        txt!,
        style: GoogleFonts.mallanna(color: AppColors.primaryDark, fontSize: 16),
      ),
      decoration: BoxDecoration(
        color: AppColors.highlightColor,
        border: Border.all(color: AppColors.primaryDark!, width: 1.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}
