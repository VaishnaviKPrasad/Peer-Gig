import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/repositories/slot_booking/my_appointments_repository_base.dart';
import './single_appointment_info_repository.dart';

class MyAppointmentsRepository extends MyAppointmentsRepositoryBase {
  final CollectionReference _myAppointmentsCollection =
      FirebaseFirestore.instance.collection('MyAppointments');

  // get fifteen mins appointments
  @override
  Future<List<String>> getFifteenMinsAppointments(String userId) async {
    return await _myAppointmentsCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['fifteenMinsAppointments']);
  }

  // get mock interview appointments
  @override
  Future<List<String>> getMockInterviewAppointments(String userId) async {
    return await _myAppointmentsCollection.doc(userId).get().then(
        (docSnap) => (docSnap.data()! as Map)['mockInterviewAppointments']);
  }

  // add a fifteen mins appointment
  @override
  Future<void> addFifteenMinsAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required Map<String, Object>? appointmentDetails}) async {
    String appointmentId = await SingleAppointmentInfoRepository()
        .addNewAppointment(appointmentDetails);

    await _myAppointmentsCollection.doc(userId1).get().then((docSnap) =>
        (docSnap.data()! as Map)['fifteenMinsAppointments'].add(appointmentId));

    await _myAppointmentsCollection.doc(userId2).get().then((docSnap) =>
        (docSnap.data()! as Map)['fifteenMinsAppointments'].add(appointmentId));
  }

  // add a mock interview appointment
  @override
  Future<void> addMockInterviewAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required Map<String, Object>? appointmentDetails}) async {
    String appointmentId = await SingleAppointmentInfoRepository()
        .addNewAppointment(appointmentDetails);

    await _myAppointmentsCollection.doc(userId1).get().then((docSnap) =>
        (docSnap.data()! as Map)['mockInterviewAppointments']
            .add(appointmentId));

    await _myAppointmentsCollection.doc(userId2).get().then((docSnap) =>
        (docSnap.data()! as Map)['mockInterviewAppointments']
            .add(appointmentId));
  }

  //delete a fifteen mins appointment
  @override
  Future<void> deleteFifteenMinsAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required String? appointmentId}) async {
    await _myAppointmentsCollection.doc(userId1).get().then((docSnap) =>
        (docSnap.data()! as Map)['fifteenMinsAppointments']
            .remove(appointmentId));
    await _myAppointmentsCollection.doc(userId2).get().then((docSnap) =>
        (docSnap.data()! as Map)['fifteenMinsAppointments']
            .remove(appointmentId));
    await SingleAppointmentInfoRepository().deleteAppointment(appointmentId!);
  }

  //delete a mock interview appointment
  @override
  Future<void> deleteMockInterviewAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required String? appointmentId}) async {
    await _myAppointmentsCollection.doc(userId1).get().then((docSnap) =>
        (docSnap.data()! as Map)['mockInterviewAppointments']
            .remove(appointmentId));
    await _myAppointmentsCollection.doc(userId2).get().then((docSnap) =>
        (docSnap.data()! as Map)['mockInterviewAppointments']
            .remove(appointmentId));
    await SingleAppointmentInfoRepository().deleteAppointment(appointmentId!);
  }
}
