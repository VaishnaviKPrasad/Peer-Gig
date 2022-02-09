import 'package:flutter/material.dart';
import '../../entities/authentication/user.dart';

abstract class UserRepositoryBase {
  Future<void> addUser(User user);

  Future<void> deleteUser(String userId);

  Future<void> addAchievement({@required String userid, String achievement});
  Future<void> addAskMeAbout({@required String userid, String askMeAbout});
  Future<void> addBranch({@required String userid, String branch});
  Future<void> addCompany({@required String userid, String company});
  Future<void> addExperience({@required String userid, String experience});
  Future<void> addFullName({@required String userid, String fullName});
  Future<void> addGitHub({@required String userid, String gitHub});
  Future<void> addHeadline({@required String userid, String headline});
  Future<void> addLinkedIn({@required String userid, String linkedin});
  Future<void> addTechStack({@required String userid, String techStack});
  Future<void> addYear({@required String userid, int year});
  Future<void> addCourse({@required String userid, String course});

  Future<void> updateFullName({@required String userid, String newVal});
  Future<void> updateAchievements({@required String userid, String newVal});
  Future<void> updateAskMeAbout({@required String userid, String newVal});
  Future<void> updateBranch({@required String userid, String newVal});
  Future<void> updateCompany({@required String userid, String newVal});
  Future<void> updateExperience({@required String userid, String newVal});
  Future<void> updateGithub({@required String userid, String newVal});
  Future<void> updateHeadline({@required String userid, String newVal});
  Future<void> updateLinkedIn({@required String userid, String newVal});
  Future<void> updateTechStack({@required String userid, String newVal});
  Future<void> updateYear({@required String userid, int newVal});
  Future<void> updateCourse({@required String userid, String newVal});

  Future<List<User>> searchByBranch(String branchVal);
  Future<List<User>> searchByAchievement(String achievementVal);
  Future<List<User>> searchByAskMeAbout(String askMeAboutVal);
  Future<List<User>> searchByCompany(String companyVal);
  Future<List<User>> searchByCourse(String courseVal);
  Future<List<User>> searchByTechStacks(String techStacksVal);
  Future<List<User>> searchByYear(int yearVal);
}
