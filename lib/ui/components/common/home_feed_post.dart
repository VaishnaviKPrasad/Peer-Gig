import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/components/common/dp_username_display.dart';
import 'package:peer_gig/ui/widgets/common/post.dart';
import '../../config/constants/colors.dart';

class HomeFeedPost extends StatelessWidget {
  final String? txt;
  final String? dpUrl;
  final String? username;
  final String? postDate;
  const HomeFeedPost(
      {Key? key,
      @required this.txt,
      @required this.dpUrl,
      @required this.username,
      @required this.postDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DpUsernameDisplay(dpUrl: dpUrl, username: username),
                Text(postDate!,
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, fontSize: 18))
              ]),
          Post(txt: txt)
        ]);
  }
}
