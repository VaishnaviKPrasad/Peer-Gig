import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeFeedPostsDBHelper {
  final CollectionReference homeFeedPostsCollection =
      FirebaseFirestore.instance.collection('HomeFeedPosts');

  // get my home feed posts (of a user)
  Future<List<String>> getMyHomeFeedPosts(String userId) async {
    List<String> res = await homeFeedPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['homeFeedPosts']);
    return res;
  }

  // add the new post shared by one of the peers whom a user follows in the user's home feed
  Future<void> addNewHomeFeedPost(
      {@required String? userId, @required String? postId}) async {
    await homeFeedPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['homeFeedPosts'].add(postId));
  }
}
