import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FifteenMinsSlotInfoRepository {
  final CollectionReference _fifteenMinsSlotInfoCollection =
      FirebaseFirestore.instance.collection('FifteenMinsSlotInfo');

  // get slot details
  Future<String> getDays(String userId) async {
    return await _fifteenMinsSlotInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['days']);
  }

  Future<int> getStartTime(String userId) async {
    return await _fifteenMinsSlotInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['startTime']);
  }

  Future<int> getEndTime(String userId) async {
    return await _fifteenMinsSlotInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['endTime']);
  }

  // add appointment details for a new/existing user
  Future<void> addAppointmentDetails(
      {@required String? userId,
      @required Map<String, Object>? appointmentDetails}) async {
    await _fifteenMinsSlotInfoCollection
        .add(userId)
        .then((docRef) => docRef.set(appointmentDetails));
  }

  // update the appointment details of a user
  Future<void> updateSlotInfo(
      {@required String? userId,
      @required Map<String, Object>? newDetails}) async {
    await _fifteenMinsSlotInfoCollection.doc(userId).update(newDetails!);
  }

  // delete the availability of user
  Future<void> deleteAppointmentDetails(String userId) async {
    await _fifteenMinsSlotInfoCollection.doc(userId).delete();
  }
}
