import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants/colors.dart';
import '../widgets/common/custom_button.dart';

class MyAppointmentsComponent extends StatefulWidget {
  final String username;
  final String date;
  final int startTime;
  final int endTime;
  const MyAppointmentsComponent({ 
    Key? key, required this.username, required this.date, required this.startTime, required this.endTime}) 
    : super(key: key);

  @override
  _MyAppointmentsComponentState createState() => _MyAppointmentsComponentState();
}

class _MyAppointmentsComponentState extends State<MyAppointmentsComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryDark,
          radius: 29,
          child: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
              ),
              radius: 28,
          )
        ),
        const SizedBox(width: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text(
              widget.username, 
              style: GoogleFonts.mallanna(
                  color: AppColors.highlightColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
            ),
            //const SizedBox(height: 5.0),
            Text(
              widget.date, 
              style: GoogleFonts.mallanna(
                  color: AppColors.highlightColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  height: 1.15,
                ),
                textAlign: TextAlign.center,
            ),
            //const SizedBox(height: 5.0),
            Text(
              widget.startTime.toString().substring(0,2)+":"+widget.startTime.toString().substring(2)
              +' - '+
              widget.endTime.toString().substring(0,2)+":"+widget.endTime.toString().substring(2), 
              style: GoogleFonts.mallanna(
                  color: AppColors.highlightColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  height: 1.15,
                ),
                textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(width: 5.0),
        const CustomButton(txt: 'Cancel'),
      ],
    );
  }
}