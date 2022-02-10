import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:peer_gig/domain/entities/common/user.dart';
import 'package:peer_gig/domain/repositories/common/user_repository_base.dart';

class UserRepository extends UserRepositoryBase {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // getter functions for user details from firestore
  @override
  Future<List<String>> getAchievements(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['achievements']);
    return res;
  }

  @override
  Future<List<String>> getAskMeAbout(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['askMeAbout']);
    return res;
  }

  @override
  Future<String> getBranch(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['branch']);
    return res;
  }

  @override
  Future<List<String>> getCompany(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['company']);
    return res;
  }

  @override
  Future<String> getEmail(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['email']);
    return res;
  }

  @override
  Future<String> getExperience(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['experience']);
    return res;
  }

  @override
  Future<String> getFullName(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['fullName']);
    return res;
  }

  @override
  Future<String> getGithub(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['github']);
    return res;
  }

  @override
  Future<String> getHeadline(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['headline']);
    return res;
  }

  @override
  Future<String> getLinkedin(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['linkedin']);
    return res;
  }

  @override
  Future<List<String>> getTechStack(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['techStack']);
    return res;
  }

  @override
  Future<int> getCurrentYear(String userId) async {
    int res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['currentYear']);
    return res;
  }

  @override
  Future<String> getCourse(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['course']);
    return res;
  }

  // functions to ADD new values in the array of values for eligible user details
  @override
  Future<void> addAchievement(
      {@required String? userId, @required String? achievement}) async {
    await usersCollection.doc(userId).get().then(
        (docSnap) => (docSnap.data()! as Map)['achievements'].add(achievement));
  }

  @override
  Future<void> addAskMeAbout(
      {@required String? userId, @required String? askMeAbout}) async {
    await usersCollection.doc(userId).get().then(
        (docSnap) => (docSnap.data()! as Map)['askMeAbout'].add(askMeAbout));
  }

  @override
  Future<void> addCompany({String? userId, String? company}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['company'].add(company));
  }

  @override
  Future<void> addTechStack(
      {@required String? userId, @required String? techStack}) async {
    await usersCollection.doc(userId).get().then(
        (docSnap) => (docSnap.data()! as Map)['techStack'].add(techStack));
  }

  // functions to update a user detail (replace the existing value with a new value)
  @override
  Future<void> updateBranch({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['branch'] = newVal);
  }

  @override
  Future<void> updateExperience({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['experience'] = newVal);
  }

  @override
  Future<void> updateFullName({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['fullName'] = newVal);
  }

  @override
  Future<void> updateGithub({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['github'] = newVal);
  }

  @override
  Future<void> updateHeadline({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['headline'] = newVal);
  }

  Future<void> updateLinkedin({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['linkedin'] = newVal);
  }

  Future<void> updateCurrentYear({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['currentYear'] = newVal);
  }

  @override
  Future<void> updateCourse({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['course'] = newVal);
  }

  // search query on users
  @override
  Future<List<String>> searchAndGetUsers(Map<String, Object> filters) async {
    List<String> res = [];
    for (var i in filters.keys) {
      if (i == 'achievements' ||
          i == 'askMeAbout' ||
          i == 'company' ||
          i == 'techStack') {
        QuerySnapshot querySnapshots = await usersCollection
            .where(
              i,
              arrayContains: filters[i],
            )
            .get();

        for (var singleDoc in querySnapshots.docs) {
          res.add(singleDoc.id);
        }
      } else {
        QuerySnapshot querySnapshots = await usersCollection
            .where(
              i,
              isEqualTo: filters[i],
            )
            .get();

        for (var singleDoc in querySnapshots.docs) {
          res.add(singleDoc.id);
        }
      }
    }

    return res;
  }

  @override
  Future<void> addUser(User user) {
    // ignore: todo
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String userId) {
    // ignore: todo
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateLinkedIn(
      {@required String? userId, @required String? newVal}) {
    // ignore: todo
    // TODO: implement updateLinkedIn
    throw UnimplementedError();
  }

  @override
  Future<void> updateYear({@required String? userId, @required int? newVal}) {
    // ignore: todo
    // TODO: implement updateYear
    throw UnimplementedError();
  }

  /* functions to delete a value from the array of values for eligible user details
  Future<void> deleteAchievement({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['achievements'].remove(value));
  }

  Future<void> deleteAskMeAbout({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout'].remove(value));
  }

  Future<void> deleteCompany({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['company'].remove(value));
  }

  Future<void> deleteTechStack({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['techStack'].remove(value));
  }
  */
}
