import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/application/slot_booking/fifteen_mins_slot_info_app_service.dart';
import 'package:peer_gig/application/slot_booking/manage_my_slots_app_service.dart';
import 'package:peer_gig/application/slot_booking/mock_interview_slot_info_app_service.dart';
import 'package:peer_gig/ui/components/duration_display_dropdown_component.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/custom_drop_down_button.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_drop_down_button.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_future_builder_component.dart';
import 'package:peer_gig/utils/app_utils.dart';

class ManageMySlotsScreen extends StatefulWidget {
  const ManageMySlotsScreen({Key? key}) : super(key: key);

  @override
  State<ManageMySlotsScreen> createState() => _ManageMySlotsScreenState();
}

class _ManageMySlotsScreenState extends State<ManageMySlotsScreen> {
  String? userId = AuthAppService().getEmailOfUser();
  String? _daySelectedForFifteenMinsSlot = "";
  String? _daySelectedForMockInterviewSlot = "";
  int? _startTimeSelectedForFifteenMinsSlot = 0000;
  int? _endTimeSelectedForFifteenMinsSlot = 0000;
  int? _startTimeSelectedForMockInterviewSlot = 0000;
  int? _endTimeSelectedForMockInterviewSlot = 0000;

  void _getDaySelectedForFifteenMinsSlot(String? val) {
    _daySelectedForFifteenMinsSlot = val;
    print(
        "######### _daySelectedForFifteenMinsSlot $_daySelectedForFifteenMinsSlot");
  }

  void _getDaySelectedForMockInterviewSlot(String? val) {
    _daySelectedForMockInterviewSlot = val;
    print(
        "######### _daySelectedForMockInterviewSlot $_daySelectedForMockInterviewSlot");
  }

// 17:00
// 01234
  void _getStartTimeSelectedForFifteenMinsSlot(String? val) {
    val = val?.replaceAll(':', '');
    _startTimeSelectedForFifteenMinsSlot = int.parse(val ?? "");
    print(
        "######### _startTimeSelectedForFifteenMinsSlot $_startTimeSelectedForFifteenMinsSlot");
  }

  void _getEndTimeSelectedForFifteenMinsSlot(String? val) {
    val = val?.replaceAll(':', '');
    _endTimeSelectedForFifteenMinsSlot = int.parse(val!);
    print(
        "######### _endTimeSelectedForFifteenMinsSlot $_endTimeSelectedForFifteenMinsSlot");
  }

  void _getStartTimeSelectedForMockInterviewSlot(String? val) {
    val = val?.replaceAll(':', '');
    _startTimeSelectedForMockInterviewSlot = int.parse(val!);
    print(
        "######### _startTimeSelectedForMockInterviewSlot $_startTimeSelectedForMockInterviewSlot");
  }

  void _getEndTimeSelectedForMockInterviewSlot(String? val) {
    val = val?.replaceAll(':', '');
    _endTimeSelectedForMockInterviewSlot = int.parse(val!);
    print(
        "######### _endTimeSelectedForMockInterviewSlot $_endTimeSelectedForMockInterviewSlot");
  }

  void _saveTheUserInfo() {
    Map<String, Object> _fifteenMinsSlotInfoMap = {
      'days': _daySelectedForFifteenMinsSlot!,
      'startTime': _startTimeSelectedForFifteenMinsSlot!,
      'endTime': _endTimeSelectedForFifteenMinsSlot!
    };

    Map<String, Object> _mockInterviewSlotInfoMap = {
      'days': _daySelectedForMockInterviewSlot!,
      'startTime': _startTimeSelectedForMockInterviewSlot!,
      'endTime': _endTimeSelectedForMockInterviewSlot!,
    };

    ManageMySlotsAppService.saveSlotInfo(
        _fifteenMinsSlotInfoMap, _mockInterviewSlotInfoMap);
  }

  List<String> displayTimings = AppUtils.getAllDisplayTimings();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Update 15 mins slot info :",
                style: GoogleFonts.mallanna(
                    color: AppColors.highlightColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                future: FifteenMinsSlotInfoAppService.getFifteenMinsSlotInfo(
                    userId!),
                builder: (BuildContext ctx,
                    AsyncSnapshot<Map<String, String>> snapshot) {
                  if (snapshot.hasData) {
                    var days = snapshot.data!['days'];
                    var startTime = snapshot.data!['startTime'];
                    var endTime = snapshot.data!['endTime'];
                    return Text(
                      "Available on $days from $startTime to $endTime",
                      style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor,
                        fontSize: 18,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }

                  return const CircularProgressIndicator();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Days Available:",
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, fontSize: 21),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SearchTagsDropDown(
                      txt: 'Days',
                      fields: const ['Weekdays', 'Weekends'],
                      onChangedFunc: _getDaySelectedForFifteenMinsSlot,
                    ),
                  ),
                ],
              ),
              Text(
                "Time Available:",
                style: GoogleFonts.mallanna(
                    color: AppColors.highlightColor, fontSize: 21),
              ),
              DurationDisplayDropdownComponent(
                start: displayTimings,
                end: displayTimings,
                startTimeOnChangedFunc: _getStartTimeSelectedForFifteenMinsSlot,
                endTimeOnChangedFunc: _getEndTimeSelectedForFifteenMinsSlot,
              ),
              Text(
                "Update 1 hr mock interview slot info :",
                style: GoogleFonts.mallanna(
                    color: AppColors.highlightColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                future:
                    MockInterviewSlotInfoAppService.getMockInterviewSlotInfo(
                        userId!),
                builder: (BuildContext ctx,
                    AsyncSnapshot<Map<String, String>> snapshot) {
                  if (snapshot.hasData) {
                    var days = snapshot.data!['days'];
                    var startTime = snapshot.data!['startTime'];
                    var endTime = snapshot.data!['endTime'];
                    return Text(
                      "Available on $days from $startTime to $endTime",
                      style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor,
                        fontSize: 18,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }

                  return const CircularProgressIndicator();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Days Available:",
                    style: GoogleFonts.mallanna(
                        color: AppColors.highlightColor, fontSize: 21),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SearchTagsDropDown(
                      txt: 'Days',
                      fields: const ['Weekdays', 'Weekends'],
                      onChangedFunc: _getDaySelectedForMockInterviewSlot,
                    ),
                  ),
                ],
              ),
              Text("Time Available:",
                  style: GoogleFonts.mallanna(
                      color: AppColors.highlightColor, fontSize: 21)),
              DurationDisplayDropdownComponent(
                start: displayTimings,
                end: displayTimings,
                startTimeOnChangedFunc:
                    _getStartTimeSelectedForMockInterviewSlot,
                endTimeOnChangedFunc: _getEndTimeSelectedForMockInterviewSlot,
              ),
              Center(
                child: CustomButton(
                  txt: "Save My Settings",
                  onPressedFunc: () {
                    _saveTheUserInfo();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Settings Saved!"),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
