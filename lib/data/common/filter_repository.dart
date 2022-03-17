import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/common/filter_repository_base.dart';

class FilterRepository extends FilterRepositoryBase {
  final CollectionReference _filterTagsCollection =
      FirebaseFirestore.instance.collection('Filter');

  // get the list of values for a particular filter tag
  @override
  Future<List<String>> getAchievementsList() async {
    List<String> res = await _filterTagsCollection
        .doc('achievements')
        .get()
        .then((docSnap) =>
            List<String>.from((docSnap.data()! as Map)['achievements']));
    return res;
  }

  @override
  Future<List<String>> getAskMeAboutList() async {
    List<String> res = await _filterTagsCollection.doc('askMeAbout').get().then(
        (docSnap) => List<String>.from((docSnap.data()! as Map)['askMeAbout']));
    return res;
  }

  @override
  Future<List<String>> getBranchList() async {
    List<String> res = await _filterTagsCollection.doc('branch').get().then(
        (docSnap) => List<String>.from((docSnap.data()! as Map)['branch']));
    return res;
  }

  @override
  Future<List<String>> getCourseList() async {
    List<String> res = await _filterTagsCollection.doc('course').get().then(
        (docSnap) => List<String>.from((docSnap.data()! as Map)['course']));
    return res;
  }

  @override
  Future<List<String>> getTechStackList() async {
    List<String> res = await _filterTagsCollection.doc('techStack').get().then(
        (docSnap) => List<String>.from((docSnap.data()! as Map)['techStack']));
    return res;
  }

  @override
  Future<List<String>> getCompanyList() async {
    List<String> res = await _filterTagsCollection.doc('company').get().then(
        (docSnap) => List<String>.from((docSnap.data()! as Map)['company']));
    return res;
  }

  @override
  Future<List<String>> getYearList() async {
    List<String> res = await _filterTagsCollection
        .doc('year')
        .get()
        .then((docSnap) => List<String>.from((docSnap.data()! as Map)['year']));
    return res;
  }

  // add a new value in the filter tag list
  @override
  Future<void> addAchievementInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('achievements')
        .update({"achievements": FieldValue.arrayUnion(value)});
  }

  @override
  Future<void> addAskMeAboutInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('askMeAbout')
        .update({"askMeAbout": FieldValue.arrayUnion(value)});
  }

  @override
  Future<void> addBranchInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('branch')
        .update({"branch": FieldValue.arrayUnion(value)});
  }

  @override
  Future<void> addCourseInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('course')
        .update({"course": FieldValue.arrayUnion(value)});
  }

  @override
  Future<void> addCompanyInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('company')
        .update({"company": FieldValue.arrayUnion(value)});
  }

  @override
  Future<void> addTeckStackInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('techStack')
        .update({"techStack": FieldValue.arrayUnion(value)});
  }

  @override
  Future<void> addYearInList(List<String?> value) async {
    await _filterTagsCollection
        .doc('year')
        .update({"year": FieldValue.arrayUnion(value)});
  }
}
