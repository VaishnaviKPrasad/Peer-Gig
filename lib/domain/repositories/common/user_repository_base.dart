import 'package:flutter/material.dart';
import '../../entities/common/user.dart';

abstract class UserRepositoryBase {
  Future<void> addUser(User user);
  Future<void> deleteUser(String userId);

  Future<void> addAchievement({@required String userid, String achievement});
  Future<void> addAskMeAbout({@required String userid, String askMeAbout});
  Future<void> addCompany({@required String userid, String company});
  Future<void> addTechStack({@required String userid, String techStack});

  Future<void> updateFullName({@required String userid, String newVal});
  Future<void> updateBranch({@required String userid, String newVal});
  Future<void> updateExperience({@required String userid, String newVal});
  Future<void> updateGithub({@required String userid, String newVal});
  Future<void> updateHeadline({@required String userid, String newVal});
  Future<void> updateLinkedIn({@required String userid, String newVal});
  Future<void> updateYear({@required String userid, int newVal});
  Future<void> updateCourse({@required String userid, String newVal});

  Future<List<String>> searchAndGetUsers(Map<String, Object> filters);
}
