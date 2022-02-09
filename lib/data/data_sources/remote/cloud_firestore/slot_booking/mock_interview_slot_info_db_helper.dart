import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MockInterviewSlotInfoDBHelper {
  final CollectionReference mockInterviewSlotInfoCollection =
      FirebaseFirestore.instance.collection('MockInterviewSlotInfo');

  // get slot details
  Future<String> getDays(String userId) async {
    return await mockInterviewSlotInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['days']);
  }

  // add appointment details for a new/existing user
  Future<void> addAppointmentDetails(
      {@required String? userId,
      @required Map<String, Object>? appointmentDetails}) async {
    await mockInterviewSlotInfoCollection
        .add(userId)
        .then((docRef) => docRef.set(appointmentDetails));
  }

  // update the appointment details of a user
  Future<void> updateSlotInfo(
      {@required String? userId,
      @required Map<String, Object>? newDetails}) async {
    await mockInterviewSlotInfoCollection.doc(userId).update(newDetails!);
  }
}
