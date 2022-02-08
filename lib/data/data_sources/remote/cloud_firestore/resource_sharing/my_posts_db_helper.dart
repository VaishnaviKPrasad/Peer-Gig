import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MyPostsDBHelper {
  final CollectionReference myPostsCollection =
      FirebaseFirestore.instance.collection('MyPosts');

  // get my posts (of a user)
  Future<List<String>> getMyPosts(String userId) async {
    List<String> res = await myPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['myPosts']);
    return res;
  }

  // add a new post in 'my posts' (share a new post)
  Future<void> addNewPost(
      {@required String? userId, @required String? postId}) async {
    await myPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['myPosts'].add(postId));
  }
}
