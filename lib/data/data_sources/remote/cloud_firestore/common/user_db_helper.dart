import 'package:cloud_firestore/cloud_firestore.dart';

class UserDBHelper {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // getter functions for user details from firestore
  Future<List<String>> getAchievements(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['achievements']);
    return res;
  }

  Future<List<String>> getAskMeAbout(String userId) async {}

  Future<String> getBranch(String userId) async {}

  Future<List<String>> getCompany(String userId) async {}

  Future<String> getEmail(String userId) async {}

  Future<String> getExperience(String userId) async {}

  Future<String> getFullName(String userId) async {}

  Future<String> getGithub(String userId) async {}

  Future<String> getHeadline(String userId) async {}

  Future<String> getLinkedin(String userId) async {}

  Future<String> getTechStack(String userId) async {}

  Future<int> getCurrentYear(String userId) async {}

  Future<String> getCourse(String userId) async {}

  // functions to ADD new values in the array of values for eligible user details
  Future<void> addAchievement({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['achievements'].add(value));
  }

  Future<void> addAskMeAbout({String? userId, String? value}) async {}

  Future<void> addCompany({String? userId, String? value}) async {}

  Future<void> addTechStack({String? userId, String? value}) async {}

  // functions to delete a value from the array of values for eligible user details
  Future<void> deleteAchievement({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['achievements'].remove(value));
  }

  Future<void> deleteAskMeAbout({String? userId, String? value}) async {}

  Future<void> deleteCompany({String? userId, String? value}) async {}

  Future<void> deleteTechStack({String? userId, String? value}) async {}

  // functions to update a user detail (replace the existing value with a new value)
  Future<void> updateBranch({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['branch'] = newVal);
  }

  Future<void> updateExperience({String? userId, String? newVal}) async {}

  Future<void> updateFullName({String? userId, String? newVal}) async {}

  Future<void> updateGithub({String? userId, String? newVal}) async {}

  Future<void> updateHeadline({String? userId, String? newVal}) async {}

  Future<void> updateLinkedin({String? userId, String? newVal}) async {}

  Future<void> updateCurrentYear({String? userId, String? newVal}) async {}

  Future<void> updateCourse({String? userId, String? newVal}) async {}

  // search query on users
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
  }
}
