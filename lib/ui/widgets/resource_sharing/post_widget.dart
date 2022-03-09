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
      height: 175.0,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            txt!,
            style: GoogleFonts.mallanna(color: AppColors.text, fontSize: 16),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.highlightColor,
        border: Border.all(color: AppColors.primaryDark!, width: 1.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}
