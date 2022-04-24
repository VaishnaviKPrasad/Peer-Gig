import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/resource_sharing/follow_info_repository_base.dart';

class FollowInfoRepository extends FollowInfoRepositoryBase {
  final CollectionReference _followInfoCollection =
      FirebaseFirestore.instance.collection('FollowInfo');

  // get the count of followers
  @override
  Future<int> getFollowersCount(String userId) async {
    return await _followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['followers'].length);
  }

  // get the count of following
  @override
  Future<int> getFollowingCount(String userId) async {
    return await _followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['following'].length);
  }

  // get followers of a user
  @override
  Future<List<dynamic>> getFollowers(String userId) async {
    return _followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['followers']);
  }

  // get following of a user
  @override
  Future<List<dynamic>> getFollowing(String userId) async {
    return _followInfoCollection
        .doc(userId)
        .get()
        .then((docSnap) => ((docSnap.data()! as Map)['following']));
  }

  // add a new follower for a user
  @override
  Future<void> addNewFollower(
      {String? userId, String? newFollowerUserId}) async {
    await _followInfoCollection.doc(userId).update({
      'followers': FieldValue.arrayUnion([newFollowerUserId])
    });
    // return await _followInfoCollection.doc(userId).get().then((docSnap) =>
    //     (docSnap.data()! as Map)['followers'].add(newFollowerUserId));
  }

  // add a new following for a user
  @override
  Future<void> addNewFollowing(
      {String? userId, String? newFollowingUserId}) async {
    await _followInfoCollection.doc(userId).update({
      'following': FieldValue.arrayUnion([newFollowingUserId])
    });
    // await _followInfoCollection.doc(userId).get().then((docSnap) =>
    //     (docSnap.data()! as Map)['following'].add(newFollowingUserId));
  }
}
