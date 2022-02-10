import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/common/filter_repository_base.dart';

class FilterRepository extends FilterRepositoryBase {
  final CollectionReference filterTagsCollection =
      FirebaseFirestore.instance.collection('Filter');

  // get the list of values for a particular filter tag
  @override
  Future<List<String>> getAchievementsList(String? achievements) async {
    List<String> res = await filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['achievements']);
    return res;
  }

  @override
  Future<List<String>> getAskMeABoutList(String? askMeAbout) async {
    List<String> res = await filterTagsCollection
        .doc('askMeAbout')
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout']);
    return res;
  }

  @override
  Future<List<String>> getBranchList(String? branch) async {
    List<String> res = await filterTagsCollection
        .doc('branch')
        .get()
        .then((docSnap) => docSnap.data()['branch']);
    return res;
  }

  @override
  Future<List<String>> getCourseList(String? course) async {
    List<String> res = await filterTagsCollection
        .doc('course')
        .get()
        .then((docSnap) => docSnap.data()['course']);
    return res;
  }

  @override
  Future<List<String>> getTechStackList(String? techStack) async {
    List<String> res = await filterTagsCollection
        .doc('techStack')
        .get()
        .then((docSnap) => docSnap.data()['techStack']);
    return res;
  }

  @override
  Future<List<String>> getCompanyList(String? company) async {
    List<String> res = await filterTagsCollection
        .doc('company')
        .get()
        .then((docSnap) => docSnap.data()['company']);
    return res;
  }

  @override
  Future<List<int>> getYearList(String? year) async {
    List<int> res = await filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => docSnap.data()['year']);
    return res;
  }

  // add a new value in the filter tag list
  @override
  Future<void> addAchievementInList(String? value) async {
    await filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) => docSnap.data()['achievements'].add(value));
  }

  @override
  Future<void> addAskMeAboutInList(String? value) async {
    await filterTagsCollection
        .doc('askMeAbout')
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout'].add(value));
  }

  @override
  Future<void> addBranchInList(String? value) async {
    await filterTagsCollection
        .doc('branch')
        .get()
        .then((docSnap) => docSnap.data()['branch'].add(value));
  }

  @override
  Future<void> addCourseInList(String? value) async {
    await filterTagsCollection
        .doc('course')
        .get()
        .then((docSnap) => docSnap.data()['course'].add(value));
  }

  @override
  Future<void> addCompanyInList(String? value) async {
    await filterTagsCollection
        .doc('company')
        .get()
        .then((docSnap) => docSnap.data()['company'].add(value));
  }

  @override
  Future<void> addTeckStackInList(String? value) async {
    await filterTagsCollection
        .doc('techStack')
        .get()
        .then((docSnap) => docSnap.data()['techStack'].add(value));
  }

  @override
  Future<void> addYearInList(int? value) async {
    await filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => docSnap.data()['year'].add(value));
  }
}
