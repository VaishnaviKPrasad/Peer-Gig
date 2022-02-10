import 'package:flutter/material.dart';

abstract class MyPostsRepositoryBase {

  Future<List<String>> getMyPosts(String userId);
  Future<void> addNewPost({@required String? userId, @required Map<String, Object>? map});
}