abstract class FollowInfoRepositoryBase {
  Future<int> getFollowersCount(String userId);
  Future<int> getFollowingCount(String userId);
  Future<List<dynamic>> getFollowers(String userId);
  Future<List<dynamic>> getFollowing(String userId);
  Future<void> addNewFollower({String? userId, String? newFollowerUserId});
  Future<void> addNewFollowing({String? userId, String? newFollowingUserId});
}
