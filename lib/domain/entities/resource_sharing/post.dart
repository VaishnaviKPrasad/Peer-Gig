import 'package:flutter/foundation.dart';

class Post {
  final String? body;
  final String? postedBy;
  final int? datePosted;

  Post({
    @required this.body,
    @required this.postedBy,
    @required this.datePosted,
  });
}
