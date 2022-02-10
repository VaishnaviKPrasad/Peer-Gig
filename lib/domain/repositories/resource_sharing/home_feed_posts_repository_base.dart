import 'package:flutter/material.dart';

abstract class HomeFeedPostsRepositoryBase {

  Future<List<String>> getMyHomeFeedPosts(String userId);
  Future<void> addNewHomeFeedPost({@required String? userId, @required Map<String, Object>? map});
}