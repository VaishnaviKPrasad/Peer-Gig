import 'package:flutter/material.dart';
import 'package:peer_gig/ui/components/dp_username_display.dart';
import 'package:peer_gig/ui/widgets/common/post.dart';

class HomeFeedPost extends StatelessWidget {
  final String? txt;
  final String? dpUrl;
  final String? postID;
  final String? username;
  final String? date;
  const HomeFeedPost(
      {Key? key,
      @required this.txt,
      @required this.dpUrl,
      @required this.username,
      @required this.postID,
      @required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Post(txt: txt),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            DpUsernameDisplay(dpUrl: dpUrl, username: username),
          ])
        ]);
  }
}
