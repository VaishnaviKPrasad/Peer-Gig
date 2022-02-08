import 'package:cloud_firestore/cloud_firestore.dart';

class SinglePostInfoDBHelper {
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

  // add new post
  Future<String> addNewPost(Map<String, Object>? map) async {
    String postId =
        await singlePostInfoCollection.add(map).then((docRef) => docRef.id);

    return postId;
  }
}
