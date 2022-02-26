import 'package:flutter/material.dart';
import 'package:peer_gig/ui/components/dp_username_display.dart';
import 'package:peer_gig/ui/widgets/resource_sharing/post_widget.dart';

class AddPost extends StatelessWidget {
  final String? dpUrl;
  final String? username;
  const AddPost({Key? key, @required this.dpUrl, @required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DpUsernameDisplay(dpUrl: dpUrl, username: username),
      const PostWidget(txt: 'Type your post...')
    ]);
  }
}
