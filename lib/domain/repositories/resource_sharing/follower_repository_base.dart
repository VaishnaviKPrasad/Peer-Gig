import '../../entities/common/user.dart';

abstract class FollowerRepositoryBase {
  Future<void> addFollower(String userId, String peerId);
  Future<void> removeFollower(String userId, String peerId);
  Future<int> getFollowersCount(String userId);
  Future<List<User>> getFollowersList(String userId);
}
