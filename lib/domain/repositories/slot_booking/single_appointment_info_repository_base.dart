import '../../entities/slot_booking/appointment.dart';

abstract class SingleAppointmentRepositoryBase {
  Future<String> getBookedWith(String appointmentId);
  Future<int> getDate(String appointmentId);
  Future<int> getStartTime(String appointmentId);
  Future<int> getEndTime(String appointmentId);
  Future<bool> getIsBookedByMe(String appointmentId);

  Future<Appointment> getAppointment(String? appointmentId);
  Future<void> addNewAppointment(Map<String, Object>? map);
  Future<void> deleteAppointment(String? appointmentId);
}
