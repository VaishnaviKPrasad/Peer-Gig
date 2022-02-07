import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? txt;
  const CustomAppBar({
    Key? key,
    this.txt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primaryLight,
      title: Text(txt!,
          style: const TextStyle(
              fontFamily: 'mallanna',
              fontSize: 36,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
      elevation: 0,
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
