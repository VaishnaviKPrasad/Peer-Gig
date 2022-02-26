import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _homeFeedPostsCollection =
      FirebaseFirestore.instance.collection('HomeFeedPosts');

  // get home feed document snapshot of a user
  Stream<DocumentSnapshot> getHomeFeedPostsDocumentSnapshotForSingleUser(
      String? userId) {
    return _homeFeedPostsCollection.doc(userId).snapshots();
  }
}
