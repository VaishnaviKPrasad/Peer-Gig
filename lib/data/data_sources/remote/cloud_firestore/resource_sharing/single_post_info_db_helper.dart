import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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
  Future<void> addNewPost(
      {@required String? postId,
      @required String? body,
      @required String? postedByUserId,
      @required int? date}) async {
    Map<String, Object> map = {};
    map['body'] = body!;
    map['postedBy'] = postedByUserId!;
    map['datePosted'] = date!;
    await singlePostInfoCollection.doc(postId).set(map);
  }
}
