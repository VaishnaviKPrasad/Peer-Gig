import 'package:flutter/foundation.dart';

abstract class MyAppointmentsRepositoryBase {
  Future<List<String>> getFifteenMinsAppointments(String userId);
  Future<void> addFifteenMinsAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required Map<String, Object>? appointmentDetails});
  Future<void> deleteFifteenMinsAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required String? appointmentId});

  Future<List<String>> getMockInterviewAppointments(String userId);
  Future<void> addMockInterviewAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required Map<String, Object>? appointmentDetails});
  Future<void> deleteMockInterviewAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required String? appointmentId});
}
