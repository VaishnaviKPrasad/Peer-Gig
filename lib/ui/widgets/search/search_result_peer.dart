import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants/colors.dart';

class SearchResultPeer extends StatelessWidget {
  const SearchResultPeer(String s, {Key? key}) : super(key: key);

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
                  "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                ),
                radius: 25)),
        ListTile(
          tileColor: AppColors.primaryLight,
          onTap: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            'XYZ name',
            style: GoogleFonts.mallanna(
                color: AppColors.primaryDark, fontSize: 20),
          ),
          subtitle: Text('Data Engineering Intern @Oracle',
              style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark, fontSize: 18)),
        )
      ],
    );
  }
}
