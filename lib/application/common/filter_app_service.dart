import 'package:cloud_firestore/cloud_firestore.dart';

class FilterAppService {
  static Future<List<Map<String, Object?>>> searchUsers(
      Map<String, String?> filters) async {
    CollectionReference _usersCollection =
        FirebaseFirestore.instance.collection("Users");
    List<String> docIds = [];
    List<String> keys = [];

    filters.forEach(
      (key, value) {
        keys.add(key);
      },
    );

    List<String> docIdsToBeRemoved = [];
    for (var key in keys) {
      if (docIds.isEmpty) {
        QuerySnapshot res = await _usersCollection
            .where(key, arrayContains: filters[key])
            .get();
        docIds.addAll(res.docs.map((queryDocSnap) => queryDocSnap.id).toList());
      } else {
        for (var docId in docIds) {
          var docSnap = await _usersCollection.doc(docId).get();

          if (filters[key] != null &&
              (docSnap.data()! as Map)[key] != filters[key]) {
            docIdsToBeRemoved.add(docId);
          }
        }
      }
    }
    docIds.removeWhere((docId) => docIdsToBeRemoved.contains(docId));
    List<Map<String, Object?>> l = [];

    try {
      await Future.forEach(
        docIds,
        (docId) async {
          var data = await _usersCollection
              .doc(docId as String?)
              .get()
              .then((docSnap) => (docSnap.data() as Map));

          l.add({
            'userId': docId,
            'dpUrl': data['dpUrl'],
            'title': data['fullName'],
            'subtitle': data['headline'],
          });
        },
      );
    } on Exception catch (ex, e) {
      print("################ Exception $ex Stack trace $e");
    }

    return l;
  }
}
