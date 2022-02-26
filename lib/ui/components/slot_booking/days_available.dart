import 'package:flutter/material.dart';
import '../../widgets/slot_booking/calendar_circle.dart';

class DaysAvailable extends StatelessWidget {
  final bool? isWeekends;
  const DaysAvailable({Key? key, @required this.isWeekends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isWeekends!) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            CalendarCircle(
              txt: 'M',
              disabled: true,
            ),
            CalendarCircle(
              txt: 'T',
              disabled: true,
            ),
            CalendarCircle(
              txt: 'W',
              disabled: true,
            ),
            CalendarCircle(
              txt: 'T',
              disabled: true,
            ),
            CalendarCircle(
              txt: 'F',
              disabled: true,
            ),
            CalendarCircle(
              txt: 'S',
              disabled: false,
            ),
            CalendarCircle(
              txt: 'S',
              disabled: false,
            )
          ]);
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            CalendarCircle(
              txt: 'M',
              disabled: false,
            ),
            CalendarCircle(
              txt: 'T',
              disabled: false,
            ),
            CalendarCircle(
              txt: 'W',
              disabled: false,
            ),
            CalendarCircle(
              txt: 'T',
              disabled: false,
            ),
            CalendarCircle(
              txt: 'F',
              disabled: false,
            ),
            CalendarCircle(
              txt: 'S',
              disabled: true,
            ),
            CalendarCircle(
              txt: 'S',
              disabled: true,
            )
          ]);
    }
  }
}
