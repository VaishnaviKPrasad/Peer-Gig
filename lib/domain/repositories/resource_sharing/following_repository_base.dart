import '../../entities/authentication/user.dart';

abstract class FollowingRepositoryBase {
  Future<void> addFollowing(String userId, String peerId);
  Future<void> removeFollowing(String userId, String peerId);
  Future<int> getFollowingsCount(String userId);
  Future<List<User>> getFollowingsList(String userId);
}
