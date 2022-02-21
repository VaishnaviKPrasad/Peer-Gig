import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/text_display.dart';
import '../config/constants/colors.dart';
import '../config/constants/peer_gig_icons.dart';
import '../widgets/common/text_display.dart';

// ignore: must_be_immutable
class DurationDisplayComponent extends StatelessWidget {
  int startTime;
  int endTime;
  DurationDisplayComponent({ Key? key, required this.startTime, required this.endTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextDisplay(txt: startTime.toString().substring(0,2)+":"+startTime.toString().substring(2)), 
            Icon(
              Icons.horizontal_rule_rounded,
              color: AppColors.primaryLight,
              size: 20.0,
            ),
            TextDisplay(txt: endTime.toString().substring(0,2)+":"+endTime.toString().substring(2)),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                const TextDisplay(txt: '-Select Date-'),
                Positioned(
                  right: 10.0, 
                  child: Icon(
                    PeerGigIcons.calendar,
                    size: 20.0,
                    color: AppColors.primaryLight,
                  )
                )
              ]
            ),
            Stack(
              children: [
                const TextDisplay(txt: '-Select Time-'),
                Positioned(
                  right: 10.0, 
                  child: Icon(
                    PeerGigIcons.clock,
                    size: 20.0,
                    color: AppColors.primaryLight,
                  )
                )
              ]
            )
          ]
        )
      ],
    );
  }
}