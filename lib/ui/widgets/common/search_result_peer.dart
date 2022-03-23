import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class SearchResultPeer extends StatelessWidget {
  final String? dpUrl;
  final String? title;
  final String? subtitle;
  final String? userId;

  const SearchResultPeer(
      {Key? key,
      @required this.userId,
      @required this.dpUrl,
      @required this.title,
      @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: AppColors.primaryLight,
          radius: 26,
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                dpUrl!,
              ),
              radius: 25)),
      tileColor: AppColors.primaryLight,
      onTap: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        title!,
        style: GoogleFonts.mallanna(
            color: AppColors.primaryDark,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle!,
          style:
              GoogleFonts.mallanna(color: AppColors.primaryDark, fontSize: 18)),
    );
  }
}
