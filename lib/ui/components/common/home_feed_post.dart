import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/resource_sharing/post_widget.dart';
import '../../../domain/entities/resource_sharing/post.dart';
import 'dp_username_display.dart';

class HomeFeedPost extends StatelessWidget {
  final Post? postDetails;
  const HomeFeedPost({Key? key, @required this.postDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        PostWidget(txt: postDetails!.body!),
      ],
    );
  }
}
