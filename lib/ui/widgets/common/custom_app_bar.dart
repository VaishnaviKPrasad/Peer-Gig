import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/peer_gig_icons.dart';
import 'package:peer_gig/ui/screens/common/root_screen.dart';
import '../../config/constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? txt;
  final PreferredSizeWidget? tabBar;
  const CustomAppBar({
    Key? key,
    @required this.txt,
    this.tabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: tabBar,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primaryLight,
      leading: (txt != "HOME SCREEN")
          ? IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RootScreen(),
                  ),
                );
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
          ? <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  PeerGigIcons.addPost,
                  color: AppColors.primaryLight,
                  size: 36.0,
                ),
              )
            ]
          : <Widget>[
              Container(),
            ],
      title: Text(
        txt!,
        style: GoogleFonts.mallanna(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => (tabBar != null)
      ? const Size.fromHeight(110)
      : const Size.fromHeight(kToolbarHeight);
}
