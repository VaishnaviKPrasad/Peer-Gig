import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/custom_text_display.dart';

import '../../config/constants/colors.dart';

class TimeDisplay extends StatelessWidget {
  final int? startTime;
  final int? endTime;
  const TimeDisplay(
      {Key? key, @required this.startTime, @required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTextDisplay(txt: startTime.toString()),
        Container(
            height: 3.0,
            width: 6.0,
            decoration: BoxDecoration(
                color: AppColors.primaryLight,
                border: Border.all(color: AppColors.primaryDark!, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(15)))),
        CustomTextDisplay(txt: endTime.toString())
      ],
    );
  }
}
