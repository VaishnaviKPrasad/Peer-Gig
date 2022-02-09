import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import './single_appointment_info_db_helper.dart';

class MyAppointmentsDBHelper {
  final CollectionReference myAppointmentsCollection =
      FirebaseFirestore.instance.collection('MyAppointments');

  // get fifteen mins appointments
  Future<List<String>> getFifteenMinsAppointments(String userId) async {
    return await myAppointmentsCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['fifteenMinsAppointments']);
  }

  // add a fifteen mins appointment
  Future<void> addFifteenMinsAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required Map<String, Object>? appointmentDetails}) async {
    String appointmentId = await SingleAppointmentInfoDBHelper()
        .addNewAppointment(appointmentDetails);

    await myAppointmentsCollection.doc(userId1).get().then((docSnap) =>
        docSnap.data()['fifteenMinsAppointments'].add(appointmentId));

    await myAppointmentsCollection.doc(userId2).get().then((docSnap) =>
        docSnap.data()['fifteenMinsAppointments'].add(appointmentId));
  }

  //delete a fifteen mins appointment
  Future<void> deleteFifteenMinsAppointment(
      {@required String? userId1,
      @required String? userId2,
      @required String? appointmentId}) async {
    await myAppointmentsCollection.doc(userId1).get().then((docSnap) =>
        docSnap.data()['fifteenMinsAppointments'].remove(appointmentId));
    await myAppointmentsCollection.doc(userId2).get().then((docSnap) =>
        docSnap.data()['fifteenMinsAppointments'].remove(appointmentId));
    await SingleAppointmentInfoDBHelper().deleteAppointment(appointmentId!);
  }
}
