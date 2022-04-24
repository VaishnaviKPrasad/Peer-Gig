import 'package:flutter/material.dart';

abstract class UserRepositoryBase {
  Future<void> addUser(Map<String, Object> user);
  Future<void> deleteUser(String userId);

  Future<String> getDpUrl(String userId);
  Future<List<dynamic>> getAchievements(String userId);
  Future<List<dynamic>> getAskMeAbout(String userId);
  Future<String> getBranch(String userId);
  Future<List<dynamic>> getCompany(String userId);
  Future<String> getEmail(String userId);
  Future<String> getExperience(String userId);
  Future<String> getFullName(String userId);
  Future<String> getGithub(String userId);
  Future<String> getHeadline(String userId);
  Future<String> getLinkedin(String userId);
  Future<List<dynamic>> getTechStack(String userId);
  Future<String> getCurrentYear(String userId);
  Future<String> getCourse(String userId);

  Future<void> addAchievement(
      {@required String? userId, @required String? newVal});
  Future<void> addAskMeAbout(
      {@required String? userId, @required String? newVal});
  Future<void> addCompany({@required String? userId, @required String? newVal});
  Future<void> addTechStack(
      {@required String? userId, @required String? newVal});
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
  Future<void> updateYear({@required String? userId, @required String? newVal});
  Future<void> updateCourse(
      {@required String? userId, @required String? newVal});

  Future<List<String>> searchAndGetUsers(Map<String, Object> filters);
}
