import 'package:flutter/foundation.dart';

class Appointment {
  final String? appointmentId;
  final String? bookedWith;
  final bool? isBookedByMe;
  final int? date;
  final int? startTime;
  final int? endTime;

  Appointment({
    @required this.appointmentId,
    @required this.bookedWith,
    @required this.isBookedByMe,
    @required this.date,
    @required this.startTime,
    @required this.endTime,
  });
}
