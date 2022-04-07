import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/components/duration_display_dropdown_component.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/custom_drop_down_button.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_drop_down_button.dart';

class ManageMySlotsScreen extends StatefulWidget {
  const ManageMySlotsScreen({ Key? key }) : super(key: key);

  @override
  State<ManageMySlotsScreen> createState() => _ManageMySlotsScreenState();
}

class _ManageMySlotsScreenState extends State<ManageMySlotsScreen> {
  List<String> startTime = ['17:00', '18:00', '19:00', '20:00'];
  List<String> endTime = ['18:00', '19:00', '20:00', '21:00'];
  List<String> startFifteen = ['17:00', '17:15', '17:30', '17:45',];
  List<String> endFifteen = ['17;15', '17:30', '17:45', '18:00'];
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[                
                  Text("Update 15 mins slot info :",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Days Available:",
                          style: GoogleFonts.mallanna(
                              color: AppColors.highlightColor, fontSize: 21)),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const SearchTagsDropDown(txt: 'Days', fields: ['Weekdays', 'Weekends'], onChangedFunc: null,)),
                    ],
                  ),
                  Text("Time Available:",
                          style: GoogleFonts.mallanna(
                              color: AppColors.highlightColor, fontSize: 21)),
                  DurationDisplayDropdownComponent(start: startFifteen, end: endFifteen),                
                  Text("Update 1 hr mock interview slot info :",
                      style: GoogleFonts.mallanna(
                          color: AppColors.highlightColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Days Available:",
                          style: GoogleFonts.mallanna(
                              color: AppColors.highlightColor, fontSize: 21)),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const SearchTagsDropDown(txt: 'Days', fields: ['Weekdays', 'Weekends'], onChangedFunc: null,)),
                    ],
                  ),
                  Text("Time Available:",
                          style: GoogleFonts.mallanna(
                              color: AppColors.highlightColor, fontSize: 21)),
                  DurationDisplayDropdownComponent(start: startTime, end: endTime),
                  Center(child: CustomButton(txt: "Save My Settings", onPressedFunc: () {  },))
                ]),
              )),
        );
  }
}