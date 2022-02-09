import '../../entities/authentication/user.dart';

abstract class UserRepositoryBase {
  Future<void> addUser(User user);

  Future<void> deleteUser(String userId);

  Future<void> addAchievement(String achievement);

  Future<void> updateFullName(String newVal);

  Future<List<User>> searchByBranch(String branchVal);
}
