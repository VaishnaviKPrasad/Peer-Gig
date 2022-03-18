import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import '../../config/constants/colors.dart';

class SingleAppointmentInfo extends StatelessWidget {
  final String? dpUrl;
  final String? bookedWith;
  final String? date;
  final int? startTime;
  final int? endTime;
  const SingleAppointmentInfo(
      {Key? key,
      @required this.dpUrl,
      @required this.bookedWith,
      @required this.date,
      @required this.startTime,
      @required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      CircleAvatar(
          backgroundColor: AppColors.primaryLight,
          radius: 26,
          child: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
              ),
              radius: 25)),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(bookedWith!,
            style: GoogleFonts.mallanna(
                color: AppColors.highlightColor, fontSize: 20)),
        Text(date!,
            style: GoogleFonts.mallanna(
                color: AppColors.highlightColor, fontSize: 17)),
        Text(startTime.toString() + "-" + endTime.toString(),
            style: GoogleFonts.mallanna(
                color: AppColors.highlightColor, fontSize: 17)),
      ]),
      CustomButton(txt: "Cancel", onPressedFunc: () {  },)
    ]);
  }
}
