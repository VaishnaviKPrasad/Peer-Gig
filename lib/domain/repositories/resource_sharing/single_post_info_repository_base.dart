abstract class SinglePostInfoRepositorybase {
  Future<String> addNewPost(Map<String, Object>? map);
  Future<Map<String, dynamic>> getPostDetails(String postId);
}

// Future<String> getPostBody(String postId);
  // Future<int> getPostDate(String postId);
  // Future<String> getPostedBy(String postId);