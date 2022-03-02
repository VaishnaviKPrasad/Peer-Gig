import 'package:flutter/material.dart';
import '../../entities/common/user.dart';

abstract class UserRepositoryBase {
  Future<void> addUser(User user);
  Future<void> deleteUser(String userId);

  Future<String> getDpUrl(String userId);
  Future<List<String>> getAchievements(String userId);
  Future<List<String>> getAskMeAbout(String userId);
  Future<String> getBranch(String userId);
  Future<List<String>> getCompany(String userId);
  Future<String> getEmail(String userId);
  Future<String> getExperience(String userId);
  Future<String> getFullName(String userId);
  Future<String> getGithub(String userId);
  Future<String> getHeadline(String userId);
  Future<String> getLinkedin(String userId);
  Future<List<String>> getTechStack(String userId);
  Future<int> getCurrentYear(String userId);
  Future<String> getCourse(String userId);

  Future<void> addAchievement(
      {@required String? userId, @required String? achievement});
  Future<void> addAskMeAbout(
      {@required String? userId, @required String? askMeAbout});
  Future<void> addCompany(
      {@required String? userId, @required String? company});
  Future<void> addTechStack(
      {@required String? userId, @required String? techStack});
  Future<void> updateFullName(
      {@required String userId, @required String? newVal});
  Future<void> updateBranch(
      {@required String? userId, @required String? newVal});
  Future<void> updateExperience(
      {@required String userId, @required String? newVal});
  Future<void> updateGithub(
      {@required String? userId, @required String? newVal});
  Future<void> updateHeadline(
      {@required String? userId, @required String? newVal});
  Future<void> updateLinkedIn(
      {@required String? userId, @required String? newVal});
  Future<void> updateYear({@required String? userId, @required int? newVal});
  Future<void> updateCourse(
      {@required String? userId, @required String? newVal});

  Future<List<String>> searchAndGetUsers(Map<String, Object> filters);
}
