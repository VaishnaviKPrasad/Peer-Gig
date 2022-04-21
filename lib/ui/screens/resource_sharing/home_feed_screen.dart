import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peer_gig/data/database_service.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';

import '../../../application/resource_sharing/post_app_service.dart';
import '../../../domain/entities/resource_sharing/post.dart';
import '../../components/common/home_feed_post.dart';

class HomeFeedScreen extends StatefulWidget {
  static const routeName = '/homeFeedScreen';
  const HomeFeedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeedScreen> {
  //final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
  final String currentUserId = 'btbtc19297_samridhi@banasthali.in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: StreamBuilder<DocumentSnapshot>(
          stream: DatabaseService()
              .getHomeFeedPostsDocumentSnapshotForSingleUser(currentUserId),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> snapshots) {
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
        ),
      ),
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
          print("######## has data !");
          return HomeFeedPost(
            postDetails: snapshot.data as Post,
          );
        }

        if (snapshot.hasError) return Text("Error: ${snapshot.error}");
        return const Text("No data");
      },
    );
  }
}
