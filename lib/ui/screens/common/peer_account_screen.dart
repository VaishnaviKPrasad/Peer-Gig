import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/screens/common/peer_about_tab_screen.dart';
import 'package:peer_gig/ui/screens/slot_booking/fifteen_mins_slot_booking_screen.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';
import 'package:peer_gig/ui/widgets/common/custom_tab_bar.dart';

import '../slot_booking/mock_interview_slot_booking_screen.dart';

class PeerAccountScreen extends StatefulWidget {
  static const routeName = '/peerAccountScreen';
  final Map peerDetails;
  const PeerAccountScreen({required this.peerDetails, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PeerAccountScreenState();
}

class _PeerAccountScreenState extends State<PeerAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          txt: widget.peerDetails['fullName'],
          tabBar: CustomTabBar(
            customTabs: [
              Text(
                "About",
                style: GoogleFonts.mallanna(
                  color: AppColors.primaryLight,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "15 Mins Slot",
                style: GoogleFonts.mallanna(
                  color: AppColors.primaryLight,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  //height: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Mock Interview",
                style: GoogleFonts.mallanna(
                  color: AppColors.primaryLight,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  height: 1.0 
                ), 
                textAlign: TextAlign.center,
              ),
            ],
            length: 3,
          ),
        ),
        body: const TabBarView(
          children: [
            PeerAboutTabScreen(),
            FifteenMinsSlotBookingScreen(
                dpUrl:
                    "https://1.bp.blogspot.com/-gz3ECbOByh0/YSyMST7rT_I/AAAAAAAAWYs/stFJ90JJpx0v3ewmmK6HMYiUmIvpNMriACLcBGAsYHQ/s1041/girl-cartoon-cute-dp-images%2B%25281%2529.jpg",
                username: "Sargam Agarwal",
                headline:
                    "Summer Analyst @Goldman Sachs'22 | MLH Prep Fellow'21 | WeTech Goldman Sachs Scholar'21 | vGHC'21| Flutter App Developer",
                isWeekends: "blah blah",
                startTime: 1700,
                endTime: 1800),
            MockInterviewSlotBookingScreen(
                dpUrl:
                    "https://1.bp.blogspot.com/-gz3ECbOByh0/YSyMST7rT_I/AAAAAAAAWYs/stFJ90JJpx0v3ewmmK6HMYiUmIvpNMriACLcBGAsYHQ/s1041/girl-cartoon-cute-dp-images%2B%25281%2529.jpg",
                title: "Sargam Agarwal",
                subtitle:
                    "Summer Analyst @Goldman Sachs'22 | MLH Prep Fellow'21 | WeTech Goldman Sachs Scholar'21 | vGHC'21| Flutter App Developer",
                isWeekends: "blah blah",
                startTime: 1700,
                endTime: 1800),
          ],
        ),
      ),
    );
  }
}
