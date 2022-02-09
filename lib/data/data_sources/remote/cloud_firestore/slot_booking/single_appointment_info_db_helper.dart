import 'package:cloud_firestore/cloud_firestore.dart';

class SingleAppointmentInfoDBHelper {
  final CollectionReference singleAppointmentInfoCollection =
      FirebaseFirestore.instance.collection('SingleAppointmentInfo');

  // get appointment details
  Future<String> getBookedWith(String appointmentId) async {
    return await singleAppointmentInfoCollection
        .doc(appointmentId)
        .get()
        .then((docSnap) => docSnap.data()['bookedWith']);
  }

  // add new appointment
  Future<String> addNewAppointment(Map<String, Object>? map) async {
    String appointmentId = await singleAppointmentInfoCollection
        .add(map)
        .then((docRef) => docRef.id);
    return appointmentId;
  }

  Future<void> deleteAppointment(String appointmentId) async {
    await singleAppointmentInfoCollection.doc(appointmentId).delete();
  }
}
