import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/resource_sharing/single_post_info_repository_base.dart';

class SinglePostInfoRepository extends SinglePostInfoRepositorybase{
  final CollectionReference singlePostInfoCollection =
      FirebaseFirestore.instance.collection('SinglePostInfo');

  // get the post details
  @override
  Future<String> getPostBody(String postId) async {
    String body = await singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['body']);

    return body;
  }

  @override
  Future<int> getPostDate(String postId) async {
    int date = await singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['date']);

    return date;
  }

  @override
  Future<String> getPostedBy(String postId) async {
    String postedBy = await singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => (docSnap.data()! as Map)['postedBy']);

    return postedBy;
  }

  // add new post
  @override
  Future<String> addNewPost(Map<String, Object>? map) async {
    String postId =
        await singlePostInfoCollection.add(map).then((docRef) => docRef.id);

    return postId;
  }
}
