import 'package:cloud_firestore/cloud_firestore.dart';

class SinglePostInfoRepository {
  final CollectionReference singlePostInfoCollection =
      FirebaseFirestore.instance.collection('SinglePostInfo');

  // get the post details
  Future<String> getPostBody(String postId) async {
    String body = await singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => docSnap.data()['body']);

    return body;
  }

  Future<int> getPostDate(String postId) async {
    int date = await singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => docSnap.data()['date']);

    return date;
  }

  Future<String> getPostedBy(String postId) async {
    String postedBy = await singlePostInfoCollection
        .doc(postId)
        .get()
        .then((docSnap) => docSnap.data()['postedBy']);

    return postedBy;
  }

  // add new post
  Future<String> addNewPost(Map<String, Object>? map) async {
    String postId =
        await singlePostInfoCollection.add(map).then((docRef) => docRef.id);

    return postId;
  }
}
