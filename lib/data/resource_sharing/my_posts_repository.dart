import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import './single_post_info_db_helper.dart';

class MyPostsRepository {
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
      {@required String? userId, @required Map<String, Object>? map}) async {
    String postId = await SinglePostInfoDBHelper().addNewPost(map);
    await myPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => docSnap.data()['myPosts'].add(postId));
  }
}
