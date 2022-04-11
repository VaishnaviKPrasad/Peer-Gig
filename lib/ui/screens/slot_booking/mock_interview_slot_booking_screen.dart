import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/components/slot_booking/duration_display_component.dart';
import 'package:peer_gig/ui/components/slot_booking/days_available.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/search_result_peer.dart';
import '../../config/constants/colors.dart';

class MockInterviewSlotBookingScreen extends StatelessWidget {
  final String? dpUrl;
  final String? title;
  final String? subtitle;
  final String? isWeekends;
  final int? startTime;
  final int? endTime;
  static const routeName = '/mockInterviewSlotBookingScreen';
  const MockInterviewSlotBookingScreen(
      {Key? key,
      @required this.dpUrl,
      @required this.title,
      @required this.subtitle,
      @required this.isWeekends,
      @required this.startTime,
      @required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: AppScreenGradient()),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SearchResultPeer(
                    dpUrl:
                        "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                    title: 'Vanshika Garg',
                    subtitle: 'B.Tech (CS) student at Banasthali Vidyapith...',
                  ),
                  Text("Book a 1hr mock interview slot:",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold)),
                  Text("Days Available: Weekdays",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor, fontSize: 21)),
                  const DaysAvailable(isWeekends: true),
                  Text("Time Duration Available:",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor, fontSize: 21)),
                  //TimeDisplay(startTime: startTime, endTime: endTime),
                  DurationDisplayComponent(
                    startTime: startTime!,
                    endTime: endTime!,
                  ),
                  Center(
                      child: CustomButton(
                    txt: "Book My Slot",
                    onPressedFunc: () {},
                  ))
                ])));
=======
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: AppScreenGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SearchResultPeer(
                dpUrl:
                    "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                title: 'Samridhi Sethi',
                subtitle: 'B.Tech (CS) student at Banasthali Vidyapith...',
              ),
              Text("Book a 1hr mock interview slot:",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold)),
              Text("Days Available: Weekdays",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor, fontSize: 21)),
              const DaysAvailable(isWeekends: true),
              Text("Time Duration Available:",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor, fontSize: 21)),
              //TimeDisplay(startTime: startTime, endTime: endTime),
              DurationDisplayComponent(
                startTime: startTime!,
                endTime: endTime!,
              ),
              Center(
                child: CustomButton(
                  txt: "Book My Slot",
                  onPressedFunc: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
>>>>>>> bdb41a362755f4ff8588b27e6cc8e3a9d27c9f8b
  }
}
