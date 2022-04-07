import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/components/slot_booking/single_appointment_info.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';

class FifteenMinsMeetingsScreen extends StatefulWidget {
  const FifteenMinsMeetingsScreen({ Key? key }) : super(key: key);

  @override
  State<FifteenMinsMeetingsScreen> createState() => _FifteenMinsMeetingsScreenState();
}

class _FifteenMinsMeetingsScreenState extends State<FifteenMinsMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: AppScreenGradient(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booked With Me:",
              style: GoogleFonts.mallanna(
                  color: AppColors.highlightColor,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15.0,),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) { 
                  return Column(
                    children: const [
                      SingleAppointmentInfo(
                        date: '27 Mar 2022', 
                        startTime: 1700, 
                        endTime: 1800, 
                        dpUrl: "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg", 
                        bookedWith: 'Samridhi Sethi',
                      ),
                      SizedBox(height: 15.0,)
                    ],
                  );
                },            
              ),
            ),
            Text(
              "Booked By Me:",
              style: GoogleFonts.mallanna(
                  color: AppColors.highlightColor,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15.0,),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) { 
                  return Column(
                    children: const [
                      SingleAppointmentInfo(
                        date: '27 Mar 2022', 
                        startTime: 1700, 
                        endTime: 1800, 
                        dpUrl: "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg", 
                        bookedWith: 'Samridhi Sethi',
                      ),
                      SizedBox(height: 15.0,)
                    ],
                  );
                },            
              ),
            )
          ],
        ),
      ),
    );
  }
}