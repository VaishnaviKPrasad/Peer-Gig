import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class SearchResultPeer extends StatelessWidget {
  final String? dpUrl;
  final String? title;
  final String? subtitle;

  const SearchResultPeer(
      {Key? key,
      @required this.dpUrl,
      @required this.title,
      @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
            backgroundColor: AppColors.primaryLight,
            radius: 26,
            child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "",
                ),
                radius: 25)),
        ListTile(
          tileColor: AppColors.primaryLight,
          onTap: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            title!,
            style: GoogleFonts.mallanna(
                color: AppColors.primaryDark,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle!,
              style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark, fontSize: 18)),
        )
      ],
    );
  }
}
