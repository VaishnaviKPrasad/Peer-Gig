import '../../entities/resource_sharing/post.dart';

abstract class PostRepositoryBase {
  addPost(Post post);
  Future<Post> getPost(String postId);
}
