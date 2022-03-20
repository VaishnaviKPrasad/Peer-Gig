import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/components/slot_booking/days_available.dart';
import 'package:peer_gig/ui/components/slot_booking/time_display.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/search_result_peer.dart';
import '../../config/constants/colors.dart';

class FifteenMinsSlotBookingScreen extends StatelessWidget {
  final String? dpUrl;
  final String? username;
  final String? headline;
  final String? isWeekends;
  final int? startTime;
  final int? endTime;

  static const routeName = '/fifteenMinsSlotBookingScreen';
  const FifteenMinsSlotBookingScreen(
      {Key? key,
      @required this.dpUrl,
      @required this.username,
      @required this.headline,
      @required this.isWeekends,
      @required this.startTime,
      @required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [AppColors.primary!, AppColors.secondary!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.60, 1.0],
            )),
            child: Column(children: <Widget>[
              const SearchResultPeer(
                dpUrl:
                    "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                title: 'Vanshika Garg', //username
                subtitle:
                    'B.Tech (CS) student at Banasthali Vidyapith...', //headline
              ),
              Text("Book a 15 mins slot:",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold)),
              Text("Days Available: Weekdays",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor, fontSize: 21)),
              const DaysAvailable(isWeekends: false),
              Text("Time Duration Available:",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor, fontSize: 21)),
              TimeDisplay(startTime: startTime, endTime: endTime),
              CustomButton(txt: "Book My Slot", onPressedFunc: () {  },)
            ])));
  }
}
