import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peer_gig/data/database_service.dart';
import 'package:peer_gig/ui/components/home_feed_post.dart';
import '../../../application/resource_sharing/post_app_service.dart';
import '../../../domain/entities/resource_sharing/post.dart';

class HomeFeedScreen extends StatefulWidget {
  static const routeName = '/homeFeedScreen';
  const HomeFeedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeedScreen> {
  // final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
  final String currentUserId = 'sargam123india@gmail.com';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: DatabaseService()
          .getHomeFeedPostsDocumentSnapshotForSingleUser(currentUserId),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshots) {
        if (snapshots.hasError) {
          return Text("Something went wrong! ${snapshots.error}");
        }
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final List<dynamic> postIds =
            (snapshots.data?.data()! as Map)['homeFeed'];
        return ListView.builder(
          itemCount: postIds.length,
          itemBuilder: (ctx, index) => HomeFeedPostBuilder(postIds[index]),
        );
      },
    );
  }
}

class HomeFeedPostBuilder extends StatelessWidget {
  final String postId;
  const HomeFeedPostBuilder(this.postId, {Key? key}) : super(key: key);

  Future<Post> _getPost() async {
    return await PostAppService().getPostFromPostId(postId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPost(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          return HomeFeedPost(
            postDetails: snapshot.data as Post,
          );
        }

        return Text("No data");
      },
    );
  }
}
