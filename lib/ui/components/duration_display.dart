import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/text_display.dart';
import '../config/constants/colors.dart';

// ignore: must_be_immutable
class DurationDisplay extends StatelessWidget {
  int startTime;
  int endTime;
  DurationDisplay({ Key? key, required this.startTime, required this.endTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextDisplay(txt: startTime.toString().substring(0,2)+":"+startTime.toString().substring(2)), 
        Icon(
          Icons.horizontal_rule_rounded,
          color: AppColors.primaryLight,
          size: 15.0,
        ),
        TextDisplay(txt: endTime.toString().substring(0,2)+":"+endTime.toString().substring(2)),
      ],
    );
  }
}