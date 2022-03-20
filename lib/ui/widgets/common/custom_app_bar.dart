import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/peer_gig_icons.dart';
import 'package:peer_gig/ui/screens/authentication/sign_in_screen.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';
import 'package:peer_gig/ui/screens/common/root_screen.dart';
import '../../config/constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String? txt;
  const CustomAppBar({
    Key? key,
    @required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primaryLight,
      leading: (txt != "HOME SCREEN") 
        ? 
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RootScreen(),
            ));
          },
          icon: Icon(
            PeerGigIcons.backArrow,
            color: AppColors.primaryLight,
            size: 26.0,
          ), 
        )
        :
        //IconButton(icon: const Icon(null), onPressed: () {  },),
        Container(),
      actions: (txt == "HOME SCREEN") 
        ? 
        <Widget>[IconButton(
          onPressed: () {  },
          icon: Icon(
            PeerGigIcons.addPost,
            color: AppColors.primaryLight,
            size: 36.0,
          ), 
        )]
        :
        //IconButton(icon: const Icon(null), onPressed: () {  },),
        <Widget>[Container(),],
      title: Text(txt!,
          style:
              GoogleFonts.mallanna(fontSize: 36, fontWeight: FontWeight.bold)),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
