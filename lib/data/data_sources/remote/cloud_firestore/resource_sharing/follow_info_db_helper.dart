import 'package:cloud_firestore/cloud_firestore.dart';

class FollowInfoDBHelper {
  final CollectionReference followInfoCollection =
      FirebaseFirestore.instance.collection('FollowInfo');

  // get the count of followers
  Future<int> getFollowersCount(String userId) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['followers'].length);
  }

  // get followers of a user
  Future<List<String>> getFollowers(String userId) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['followers']);
  }

  // add a new follower for a user
  Future<void> addNewFollower(
      {String? userId, String? newFollowerUserId}) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['followers'].add(newFollowerUserId));
  }
}
