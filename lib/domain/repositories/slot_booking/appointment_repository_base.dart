import '../../entities/slot_booking/appointment.dart';

abstract class AppointmentRepositoryBase {
  Future<void> addAppointment(Appointment appointment);
  Future<void> deleteAppointment(String appointmentId);
  Future<Appointment> getAppointment(String appointmentId);
}
