import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peer_gig/domain/entities/slot_booking/appointment.dart';

import '../../domain/repositories/slot_booking/single_appointment_info_repository_base.dart';

class SingleAppointmentInfoRepository extends SingleAppointmentRepositoryBase {
  final CollectionReference singleAppointmentInfoCollection =
      FirebaseFirestore.instance.collection('SingleAppointmentInfo');

  // get appointment details
  @override
  Future<String> getBookedWith(String appointmentId) async {
    return await singleAppointmentInfoCollection
        .doc(appointmentId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['bookedWith']);
  }

  @override
  Future<int> getDate(String appointmentId) async {
    return await singleAppointmentInfoCollection
        .doc(appointmentId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['date']);
  }

  @override
  Future<int> getStartTime(String appointmentId) async {
    return await singleAppointmentInfoCollection
        .doc(appointmentId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['startTime']);
  }

  @override
  Future<int> getEndTime(String appointmentId) async {
    return await singleAppointmentInfoCollection
        .doc(appointmentId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['endTime']);
  }

  @override
  Future<bool> getIsBookedByMe(String appointmentId) async {
    return await singleAppointmentInfoCollection
        .doc(appointmentId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['isBookedByMe']);
  }

  // add new appointment
  @override
  Future<String> addNewAppointment(Map<String, Object>? map) async {
    String appointmentId = await singleAppointmentInfoCollection
        .add(map)
        .then((docRef) => docRef.id);
    return appointmentId;
  }

  @override
  Future<void> deleteAppointment(String? appointmentId) async {
    await singleAppointmentInfoCollection.doc(appointmentId).delete();
  }

  @override
  Future<Appointment> getAppointment(String? appointmentId) {
    // ignore: todo
    // TODO: implement getAppointment
    throw UnimplementedError();
  }
}
