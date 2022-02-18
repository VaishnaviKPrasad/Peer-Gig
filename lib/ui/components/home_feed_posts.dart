import 'package:flutter/material.dart';
import 'package:peer_gig/ui/components/dp_username_display.dart';
import 'package:peer_gig/ui/widgets/common/post.dart';

class HomeFeedPosts extends StatelessWidget {
  final String? txt;
  final String? dpUrl;
  final String? username;
  const HomeFeedPosts(
      {Key? key,
      @required this.txt,
      @required this.dpUrl,
      @required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DpUsernameDisplay(dpUrl: dpUrl, username: username),
      Post(txt: txt)
    ]);
  }
}
