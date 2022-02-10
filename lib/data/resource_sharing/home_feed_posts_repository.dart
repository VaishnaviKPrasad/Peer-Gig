import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:peer_gig/data/resource_sharing/single_post_info_repository.dart';
import '../../domain/repositories/resource_sharing/home_feed_posts_repository_base.dart';

class HomeFeedPostsRepository extends HomeFeedPostsRepositoryBase{
  final CollectionReference homeFeedPostsCollection =
      FirebaseFirestore.instance.collection('HomeFeedPosts');

  // get my home feed posts (of a user)
  @override
  Future<List<String>> getMyHomeFeedPosts(String userId) async {
    List<String> res = await homeFeedPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['homeFeedPosts']);
    return res;
  }

  // add the new post shared by one of the peers whom a user follows in the user's home feed
  @override
  Future<void> addNewHomeFeedPost(
      {@required String? userId, @required Map<String, Object>? map}) async {
    String postId = await SinglePostInfoRepository().addNewPost(map);
    await homeFeedPostsCollection
        .doc(userId)
        .get()
        .then((docSnap) =>(docSnap.data()! as Map)['homeFeedPosts'].add(postId));
  }
}
