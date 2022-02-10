
abstract class SinglePostRepositorybase {

  Future<String> getPostBody(String postId);
  Future<int> getPostDate(String postId);
  Future<String> getPostedBy(String postId);
  Future<String> addNewPost(Map<String, Object>? map);
}