import 'package:flutter/material.dart';
import 'package:peer_gig/ui/screens/slot_booking/fifteen_mins_meetings_screen.dart';
import 'package:peer_gig/ui/screens/slot_booking/mock_interview_meetings_screen.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';
import 'package:peer_gig/ui/widgets/slot_booking/my_appointments_tab_bar.dart';

class MyMeetingsScreen extends StatefulWidget {
  const MyMeetingsScreen({Key? key}) : super(key: key);

  @override
  State<MyMeetingsScreen> createState() => _MyMeetingsScreenState();
}

class _MyMeetingsScreenState extends State<MyMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: CustomAppBar(
            txt: "MY MEETINGS",
            tabBar: MyAppointmentsTabBar(),
          ),
          body: TabBarView(
            children: [
              FifteenMinsMeetingsScreen(),
              MockInterviewMeetingsScreen(),
            ],
          )),
    );
  }
}
