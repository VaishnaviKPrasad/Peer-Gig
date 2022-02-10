import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:peer_gig/data/resource_sharing/single_post_info_repository.dart';
import '../../domain/repositories/resource_sharing/my_posts_repository_base.dart';

class MyPostsRepository extends MyPostsRepositoryBase{
  final CollectionReference myPostsCollection =
      FirebaseFirestore.instance.collection('MyPosts');

  // get my posts (of a user)
  @override
  Future<List<String>> getMyPosts(String userId) async {
    List<String> res = await myPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['myPosts']);
    return res;
  }

  // add a new post in 'my posts' (share a new post)
  @override
  Future<void> addNewPost(
      {@required String? userId, @required Map<String, Object>? map}) async {
    String postId = await SinglePostInfoRepository().addNewPost(map);
    await myPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['myPosts'].add(postId));
  }
}
