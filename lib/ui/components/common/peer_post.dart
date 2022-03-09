import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/widgets/resource_sharing/post_widget.dart';

class PeerPost extends StatelessWidget {
  final String? txt;
  final String? postDate;
  const PeerPost({Key? key, @required this.txt, @required this.postDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(postDate!,
                style: GoogleFonts.mallanna(
                  color: AppColors.highlightColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.right)
          ],
        ),
        PostWidget(txt: txt),
      ],
    );
  }
}
