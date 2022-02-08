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

  Future<List<String>> getAskMeAboutList() async {
    List<String> res = await filterTagsCollection
        .doc('askMeAbout')
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout']);
    return res;
  }

  Future<void> addAskMeAboutInList(String value) async {
    await filterTagsCollection
        .doc('askMeAbout')
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout'].add(value));
  }

  Future<List<String>> getBranchList() async {
    List<String> res = await filterTagsCollection
        .doc('branch')
        .get()
        .then((docSnap) => docSnap.data()['branch']);
    return res;
  }

  Future<void> addBranchInList(String value) async {
    await filterTagsCollection
        .doc('branch')
        .get()
        .then((docSnap) => docSnap.data()['branch'].add(value));
  }

  Future<List<String>> getCourseList() async {
    List<String> res = await filterTagsCollection
        .doc('course')
        .get()
        .then((docSnap) => docSnap.data()['course']);
    return res;
  }

  Future<void> addCourseInList(String value) async {
    await filterTagsCollection
        .doc('course')
        .get()
        .then((docSnap) => docSnap.data()['course'].add(value));
  }

  Future<List<String>> getCompanyList() async {
    List<String> res = await filterTagsCollection
        .doc('company')
        .get()
        .then((docSnap) => docSnap.data()['company']);
    return res;
  }

  Future<void> addCompanyInList(String value) async {
    await filterTagsCollection
        .doc('company')
        .get()
        .then((docSnap) => docSnap.data()['company'].add(value));
  }

  Future<List<String>> getTeckStackList() async {
    List<String> res = await filterTagsCollection
        .doc('techStack')
        .get()
        .then((docSnap) => docSnap.data()['techStack']);
    return res;
  }

  Future<void> addTechStackInList(String value) async {
    await filterTagsCollection
        .doc('techStack')
        .get()
        .then((docSnap) => docSnap.data()['techStack'].add(value));
  }

  Future<List<int>> getYearList() async {
    List<int> res = await filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => docSnap.data()['year']);
    return res;
  }

  Future<void> addYearInList(int value) async {
    await filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => docSnap.data()['year'].add(value));
  }
}
