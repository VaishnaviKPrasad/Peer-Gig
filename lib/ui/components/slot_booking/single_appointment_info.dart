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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: <Widget>[
      CircleAvatar(
        backgroundColor: AppColors.primaryLight,
        radius: 26,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            dpUrl!,
          ),
          radius: 25,
        )
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
          Text(
            bookedWith!,
            style: GoogleFonts.mallanna(
              color: AppColors.highlightColor, 
              fontSize: 20,
              height: 1.3,
              wordSpacing: 3.0,
            ),
          ),
          Text(
            date!,
            style: GoogleFonts.mallanna(
                color: AppColors.highlightColor, 
                fontSize: 17,
                height: 1.3,
                wordSpacing: 3.0,
            ),
          ),
          Text(
            startTime.toString().substring(0, 2) + ":" + startTime.toString().substring(2)
            + " - " + 
            endTime.toString().substring(0, 2) + ":" + endTime.toString().substring(2),
            style: GoogleFonts.mallanna(
                color: AppColors.highlightColor, 
                fontSize: 17,
                height: 1.3,
                wordSpacing: 3.0,
            )
          ),
        ]
      ),
      CustomButton(txt: "Cancel", onPressedFunc: () {  },)
    ]);
  }
}
