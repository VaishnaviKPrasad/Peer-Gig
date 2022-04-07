import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/screens/common/peer_account_screen.dart';
import '../../../data/common/user_repository.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryLight,
          radius: 26,
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                dpUrl!,
              ),
              radius: 25),
        ),
        tileColor: AppColors.primaryLight,
        onTap: () async {
          String _fullName = await UserRepository().getFullName(userId!);
          Navigator.pushNamed(context, PeerAccountScreen.routeName,
              arguments: {'userId': userId, 'fullName': _fullName});
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title!,
          style: GoogleFonts.mallanna(
              color: AppColors.primaryDark,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle!,
          style: GoogleFonts.mallanna(color: AppColors.primaryDark, fontSize: 15),
        ),
      ),
    );
  }
}
