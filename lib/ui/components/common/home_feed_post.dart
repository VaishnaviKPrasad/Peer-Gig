import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/resource_sharing/post_widget.dart';
import '../../../domain/entities/resource_sharing/post.dart';
import 'dp_username_display.dart';

class HomeFeedPost extends StatelessWidget {
  final Post? postDetails;
  const HomeFeedPost({Key? key, @required this.postDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DpUsernameDisplay(
                  dpUrl: postDetails!.dpUrl!,
                  username: postDetails!.postedByUsername!),
              Text(postDetails!.datePosted!),
            ],
          ),
          const SizedBox(height: 10.0),
          PostWidget(txt: postDetails!.body!),
          const SizedBox(height: 20.0),
        ],
      ),
=======
    print("######### PostDetails: ${postDetails}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DpUsernameDisplay(
                dpUrl: postDetails!.dpUrl!,
                username: postDetails!.postedByUsername!),
            Text(postDetails!.datePosted!),
          ],
        ),
        const SizedBox(height: 10.0),
        PostWidget(txt: postDetails!.body!),
        const SizedBox(height: 10.0),
      ],
>>>>>>> bdb41a362755f4ff8588b27e6cc8e3a9d27c9f8b
    );
  }
}
