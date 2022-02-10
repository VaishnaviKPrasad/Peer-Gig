import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // getter functions for user details from firestore
  Future<List<String>> getAchievements(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data().['achievements'] );
    return res;
  }

  Future<List<String>> getAskMeAbout(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout']);
    return res;
  }

  Future<String> getBranch(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['branch']);
    return res;
  }

  Future<List<String>> getCompany(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['company']);
    return res;
  }

  Future<String> getEmail(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['email']);
    return res;
  }

  Future<String> getExperience(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['experience']);
    return res;
  }

  Future<String> getFullName(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['fullName']);
    return res;
  }

  Future<String> getGithub(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['github']);
    return res;
  }

  Future<String> getHeadline(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['headline']);
    return res;
  }

  Future<String> getLinkedin(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['linkedin']);
    return res;
  }

  Future<List<String>> getTechStack(String userId) async {
    List<String> res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['techStack']);
    return res;
  }

  Future<int> getCurrentYear(String userId) async {
    int res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['currentYear']);
    return res;
  }

  Future<String> getCourse(String userId) async {
    String res = await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['course']);
    return res;
  }

  // functions to ADD new values in the array of values for eligible user details
  Future<void> addAchievement({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['achievements'].add(value));
  }

  Future<void> addAskMeAbout({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['askMeAbout'].add(value));
  }

  Future<void> addCompany({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['company'].add(value));
  }

  Future<void> addTechStack({String? userId, String? value}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['techStack'].add(value));
  }

  // functions to update a user detail (replace the existing value with a new value)
  Future<void> updateBranch({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['branch'] = newVal);
  }

  Future<void> updateExperience({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['experience'] = newVal);
  }

  Future<void> updateFullName({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['fullName'] = newVal);
  }

  Future<void> updateGithub({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['github'] = newVal);
  }

  Future<void> updateHeadline({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['headline'] = newVal);
  }

  Future<void> updateLinkedin({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['linkedin'] = newVal);
  }

  Future<void> updateCurrentYear({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['currentYear'] = newVal);
  }

  Future<void> updateCourse({String? userId, String? newVal}) async {
    await usersCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['course'] = newVal);
  }

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

    return res;
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
