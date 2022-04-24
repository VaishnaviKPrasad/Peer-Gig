import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:peer_gig/application/slot_booking/calendar_app_service.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/data/slot_booking/fifteen_mins_slot_info_repository.dart';
import 'package:peer_gig/ui/components/duration_display_component.dart';
import 'package:peer_gig/ui/components/slot_booking/days_available.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/search_result_peer.dart';
import 'package:peer_gig/utils/app_utils.dart';
import '../../config/constants/colors.dart';

class FifteenMinsSlotBookingScreen extends StatefulWidget {
  // final String? userId;
  // final String? dpUrl;
  // final String? username;
  // final String? headline;
  // final String? isWeekends;
  // final int? startTime;
  // final int? endTime;
  final Map? peerDetails;

  static const routeName = '/fifteenMinsSlotBookingScreen';
  const FifteenMinsSlotBookingScreen({
    Key? key,
    @required this.peerDetails,
    // @required this.userId,
    // @required this.dpUrl,
    // @required this.username,
    // @required this.headline,
    // @required this.isWeekends,
    // @required this.startTime,
    // @required this.endTime,
  }) : super(key: key);

  @override
  State<FifteenMinsSlotBookingScreen> createState() =>
      _FifteenMinsSlotBookingScreenState();
}

class _FifteenMinsSlotBookingScreenState
    extends State<FifteenMinsSlotBookingScreen> {
  late String userId;
  late String fullName;

  @override
  void initState() {
    userId = widget.peerDetails!['userId'];
    fullName = widget.peerDetails!['fullName'];
    super.initState();
  }

  Future<Map<String, String>> fetchDetails() async {
    final _fifteenMinsSlotInfoRepo = FifteenMinsSlotInfoRepository();
    Map<String, String> details = {
      'dpUrl': await UserRepository().getDpUrl(userId),
      'headline': await UserRepository().getHeadline(userId),
      'days': await _fifteenMinsSlotInfoRepo.getDays(userId),
      'startTime': AppUtils.intTimeToDisplayStringTimeFormat(
          await _fifteenMinsSlotInfoRepo.getStartTime(userId)),
      'endTime': AppUtils.intTimeToDisplayStringTimeFormat(
          await _fifteenMinsSlotInfoRepo.getEndTime(userId)),
    };
    return details;
  }

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
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: fetchDetails(),
            builder: (BuildContext ctx,
                AsyncSnapshot<Map<String, String>> snapshot) {
              if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              }
              if (snapshot.hasData) {
                var data = snapshot.data!;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SearchResultPeer(
                      dpUrl: data['dpUrl'],
                      title: fullName,
                      subtitle: data['headline'],
                    ),
                    Text(
                      "Book a 15 mins slot:",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Days Available: ${data['days']}",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor, fontSize: 21),
                    ),
                    DaysAvailable(
                      isWeekends: ((data['days']!.compareTo("Weekends")) == 0)
                          ? true
                          : false,
                    ),
                    Text(
                      "Time Duration Available:",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor, fontSize: 21),
                    ),
                    DurationDisplayComponent(
                      startTime: data['startTime']!,
                      endTime: data['endTime']!,
                    ),
                    Center(
                      child: CustomButton(
                        txt: "Book My Slot",
                        // onPressedFunc: () {
                        //   FifteenMinsSlotBookingAppService().bookAFifteenMinsSlot();
                        // },
                        onPressedFunc: () {
                          CalendarAppService().insert(
                            title: "Peer Gig Slot Booking",
                            description:
                                "Slot booked! Continue Reading for further details.",
                            location: "India (Virtual)",
                            attendeeEmailList: [
                              EventAttendee(
                                  displayName: "Sargam Agarwal",
                                  email: "sargam123india@gmail.com"),
                              EventAttendee(
                                  displayName: "Samridhi Sethi",
                                  email: "btbtc19297_samridhi@banasthali.in"),
                              EventAttendee(
                                  displayName: "Vaishnavi K. Prasad",
                                  email: "vaishnavikprasad@gmail.com"),
                            ],
                            shouldNotifyAttendees: true,
                            hasConferenceSupport: true,
                            startTime: DateTime(2022, 4, 25, 17, 30),
                            endTime: DateTime(2022, 4, 25, 17, 45),
                          );
                        },
                      ),
                    )
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
