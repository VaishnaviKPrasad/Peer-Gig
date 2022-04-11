import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/widgets/common/custom_text_display.dart';
import '../../config/constants/colors.dart';
import '../../config/constants/peer_gig_icons.dart';

class AccountProfile extends StatelessWidget {
  final String? dpUrl;
  final String? username;
  final int? followerCount;
  final int? followingCount;
  final bool? isMyAccount;
  final bool? isFollowing;

  const AccountProfile(
      {Key? key,
      @required this.dpUrl,
      @required this.username,
      @required this.followerCount,
      @required this.followingCount,
      @required this.isMyAccount,
      @required this.isFollowing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMyAccount!) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
                backgroundColor: AppColors.primaryLight,
                radius: 46,
                child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                    ),
                    radius: 45)),
            Column(children: <Widget>[
              //first row with username and FOLLOW icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomTextDisplay(txt: username, isSelector: false, name: true,),
                ]
              ),

              const SizedBox(height: 10.0,),
              //second row with follower and following counts
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    followerCount.toString() + "\nFollowers",
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, 
                        fontSize: 18,
                        height: 1.15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20.0,),
                  Text(
                    followingCount.toString() + "\nFollowing",
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, 
                        fontSize: 18,
                        height: 1.15,
                    ),
                    textAlign: TextAlign.center,
                  )
              ]),

              const SizedBox(height: 15.0,),
              //third row with posts icon and profile links
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Icon(PeerGigIcons.viewPosts, color: AppColors.highlightColor, size: 32.0),
                const SizedBox(width: 20.0,),
                Icon(FontAwesomeIcons.linkedin, color: AppColors.highlightColor, size: 28.0),
                const SizedBox(width: 20.0,),
                Icon(FontAwesomeIcons.github, color: AppColors.highlightColor, size: 28.0),
              ])
            ])
          ]);
    } else if (isFollowing!) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                backgroundColor: AppColors.primaryLight,
                radius: 13,
                child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "",
                    ),
                    radius: 12)),
            Column(children: <Widget>[
              //first row with username and FOLLOWING icon
              Row(children: <Widget>[
                CustomTextDisplay(txt: username, isSelector: null,),
                Icon(PeerGigIcons.following, color: AppColors.highlightColor)
              ]),

              //second row with follower and following counts
              Row(children: <Widget>[
                Text(followerCount.toString(),
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, fontSize: 20)),
                Text(followingCount.toString(),
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, fontSize: 20))
              ]),

              //third row with posts icon and profile links
              Row(children: <Widget>[
                Icon(PeerGigIcons.viewPosts, color: AppColors.highlightColor),
                Icon(FontAwesomeIcons.linkedin,
                    color: AppColors.highlightColor),
                Icon(FontAwesomeIcons.github, color: AppColors.highlightColor)
              ])
            ])
          ]);
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
                backgroundColor: AppColors.primaryLight,
                radius: 46,
                child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                    ),
                    radius: 45)),
            Column(children: <Widget>[
              //first row with username and FOLLOW icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomTextDisplay(txt: username, isSelector: false, name: true,),
                  const SizedBox(width: 15),
                  Icon(PeerGigIcons.follow, color: AppColors.highlightColor, size: 30.0)
                ]
              ),

              const SizedBox(height: 10.0,),
              //second row with follower and following counts
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    followerCount.toString() + "\nFollowers",
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, 
                        fontSize: 18,
                        height: 1.15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20.0,),
                  Text(
                    followingCount.toString() + "\nFollowing",
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, 
                        fontSize: 18,
                        height: 1.15,
                    ),
                    textAlign: TextAlign.center,
                  )
              ]),

              const SizedBox(height: 15.0,),
              //third row with posts icon and profile links
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Icon(PeerGigIcons.viewPosts, color: AppColors.highlightColor, size: 32.0),
                const SizedBox(width: 20.0,),
                Icon(FontAwesomeIcons.linkedin, color: AppColors.highlightColor, size: 28.0),
                const SizedBox(width: 20.0,),
                Icon(FontAwesomeIcons.github, color: AppColors.highlightColor, size: 28.0),
              ])
            ])
          ]);
    }
  }
}
