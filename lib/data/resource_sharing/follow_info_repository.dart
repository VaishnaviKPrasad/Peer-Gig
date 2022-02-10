import 'package:cloud_firestore/cloud_firestore.dart';

class FollowInfoRepository {
  final CollectionReference followInfoCollection =
      FirebaseFirestore.instance.collection('FollowInfo');

  // get the count of followers
  Future<int> getFollowersCount(String userId) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['followers'].length);
  }

  // get the count of following
  Future<int> getFollowingCount(String userId) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['following'].length);
  }

  // get followers of a user
  Future<List<String>> getFollowers(String userId) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['followers']);
  }

  // get following of a user
  Future<List<String>> getFollowing(String userId) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['following']);
  }

  // add a new follower for a user
  Future<void> addNewFollower(
      {String? userId, String? newFollowerUserId}) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['followers'].add(newFollowerUserId));
  }

  // add a new following for a user
  Future<void> addNewFollowing(
      {String? userId, String? newFollowingUserId}) async {
    return await followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['following'].add(newFollowingUserId));
  }
}
