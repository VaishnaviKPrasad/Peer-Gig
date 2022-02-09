import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FifteenMinsSlotInfoDBHelper {
  final CollectionReference fifteenMinsSlotInfoCollection =
      FirebaseFirestore.instance.collection('FifteenMinsSlotInfo');

  // get slot details
  Future<String> getDays(String userId) async {
    return await fifteenMinsSlotInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['days']);
  }

  // add appointment details for a new/existing user
  Future<void> addAppointmentDetails(
      {@required String? userId,
      @required Map<String, Object>? appointmentDetails}) async {
    await fifteenMinsSlotInfoCollection
        .add(userId)
        .then((docRef) => docRef.set(appointmentDetails));
  }

  // update the appointment details of a user
  Future<void> updateSlotInfo(
      {@required String? userId,
      @required Map<String, Object>? newDetails}) async {
    await fifteenMinsSlotInfoCollection.doc(userId).update(newDetails!);
  }

  // delete the availability of user
  Future<void> deleteAppointmentDetails(String userId) async {
    await fifteenMinsSlotInfoCollection.doc(userId).delete();
  }
}
