import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/peer_gig_icons.dart';

class AccountDetails extends StatelessWidget {
  final String? txt;
  final bool? editable;
  final String? title;
  const AccountDetails(
      {Key? key,
      @required this.txt,
      @required this.editable,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (editable!) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColors.primaryDark!, width: 1.0),
          ),
          child: ListTile(
            tileColor: AppColors.primaryLight,
            onTap: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(title!,
                style: GoogleFonts.mallanna(
                    color: AppColors.primaryDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(txt!,
                style: GoogleFonts.mallanna(
                    color: AppColors.primaryDark, fontSize: 18)),
            trailing: Icon(PeerGigIcons.edit, color: AppColors.primaryDark)
          )
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColors.primaryDark!, width: 1.0),
          ),
          child: ListTile(
              tileColor: AppColors.primaryLight,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text(title!,
                  style: GoogleFonts.mallanna(
                      color: AppColors.primaryDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(txt!,
                  style: GoogleFonts.mallanna(
                      color: AppColors.primaryDark, fontSize: 18))),
        ),
      );
    }
  }
}
