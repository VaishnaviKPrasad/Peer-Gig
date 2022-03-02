import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/resource_sharing/single_post_info_repository_base.dart';

class SinglePostInfoRepository extends SinglePostInfoRepositorybase {
  final CollectionReference _singlePostInfoCollection =
      FirebaseFirestore.instance.collection('SinglePostInfo');

  // add new post
  @override
  Future<String> addNewPost(Map<String, Object>? map) async {
    String postId =
        await _singlePostInfoCollection.add(map).then((docRef) => docRef.id);

    return postId;
  }

  // get post details
  @override
  Future<Map<String, dynamic>> getPostDetails(String postId) async {
    var docSnap = await _singlePostInfoCollection.doc(postId).get();
    return docSnap.data() as Map<String, dynamic>;
  }
}
/*
  // get the post details individually
  @override
  Future<String> getPostBody(String postId) async {
    String body = await _singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['body']);

    return body;
  }

  @override
  Future<int> getPostDate(String postId) async {
    int date = await _singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['date']);

    return date;
  }

  @override
  Future<String> getPostedBy(String postId) async {
    String postedBy = await _singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['postedBy']);

    return postedBy;
  }*/

