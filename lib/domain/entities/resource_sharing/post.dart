import 'package:flutter/foundation.dart';

class Post {
  final String? body;
  final String? postedByUsername;
  final String? datePosted;
  final String? dpUrl;

  Post({
    @required this.body,
    @required this.postedByUsername,
    @required this.datePosted,
    @required this.dpUrl,
  });
}
