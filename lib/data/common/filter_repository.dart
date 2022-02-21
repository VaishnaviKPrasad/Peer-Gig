import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/common/filter_repository_base.dart';

class FilterRepository extends FilterRepositoryBase {
  final CollectionReference filterTagsCollection =
      FirebaseFirestore.instance.collection('Filter');

  // get the list of values for a particular filter tag
  @override
  Future<List<String>> getAchievementsList() async {
    List<String> res = await filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['achievements']));
    return res;
  }

  @override
  Future<List<String>> getAskMeAboutList() async {
    List<String> res = await filterTagsCollection
        .doc('askMeAbout')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['askMeAbout']));
    return res;
  }

  @override
  Future<List<String>> getBranchList() async {
    List<String> res = await filterTagsCollection
        .doc('branch')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['branch']));
    return res;
  }

  @override
  Future<List<String>> getCourseList() async {
    List<String> res = await filterTagsCollection
        .doc('course')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['course']));
    return res;
  }

  @override
  Future<List<String>> getTechStackList() async {
    List<String> res = await filterTagsCollection
        .doc('techStack')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['techStack']));
    return res;
  }

  @override
  Future<List<String>> getCompanyList() async {
    List<String> res = await filterTagsCollection
        .doc('company')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['company']));
    return res;
  }

  @override
  Future<List<String>> getYearList() async {
    List<String> res = await filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['year']));
    return res;
  }

  // add a new value in the filter tag list
  @override
  Future<void> addAchievementInList(String? value) async {
    await filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['achievements'].add(value));
  }

  @override
  Future<void> addAskMeAboutInList(String? value) async {
    await filterTagsCollection
        .doc('askMeAbout')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['askMeAbout'].add(value));
  }

  @override
  Future<void> addBranchInList(String? value) async {
    await filterTagsCollection
        .doc('branch')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['branch'].add(value));
  }

  @override
  Future<void> addCourseInList(String? value) async {
    await filterTagsCollection
        .doc('course')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['course'].add(value));
  }

  @override
  Future<void> addCompanyInList(String? value) async {
    await filterTagsCollection
        .doc('company')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['company'].add(value));
  }

  @override
  Future<void> addTeckStackInList(String? value) async {
    await filterTagsCollection
        .doc('techStack')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['techStack'].add(value));
  }

  @override
  Future<void> addYearInList(int? value) async {
    await filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['year'].add(value));
  }
}
