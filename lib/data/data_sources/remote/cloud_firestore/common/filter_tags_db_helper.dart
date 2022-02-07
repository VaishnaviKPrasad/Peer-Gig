import 'package:cloud_firestore/cloud_firestore.dart';

class FilterTagsDBHelper {
  final CollectionReference filterTagsCollection =
      FirebaseFirestore.instance.collection('filterTags');

  // get the list of values for a particular filter tag
  Future<List<String>> getAchievementsList() async {
    List<String> res = await filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) => docSnap.data()['achievements']);
    return res;
  }

  // add a new value in the filter tag list
  Future<void> addAchievementInList(String value) async {
    await filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) => docSnap.data()['achievements'].add(value));
  }
}
