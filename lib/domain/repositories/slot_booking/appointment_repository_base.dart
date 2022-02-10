import '../../entities/slot_booking/appointment.dart';

abstract class AppointmentRepositoryBase {
  //Future<Appointment> getAppointment(String appointmentId);
  //Future<void> addAppointment(Appointment appointment);
  //Future<void> deleteAppointment(String appointmentId);

  Future<Appointment> getFifteenMinsAppointments(String appointmentId);
  Future<void> addFifteenMinsAppointment(Appointment appointment);
  Future<void> deleteFifteenMinsAppointment(String appointmentId);

  Future<Appointment> getMockInterviewAppointments(String appointmentId);
  Future<void> addMockInterviewAppointment(Appointment appointment);
  Future<void> deleteMockInterviewAppointment(String appointmentId);
}
