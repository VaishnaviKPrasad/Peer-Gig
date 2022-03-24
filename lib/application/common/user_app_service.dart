import 'package:flutter/material.dart';
import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/data/authentication/auth_repository.dart';
import 'package:peer_gig/data/common/filter_repository.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';

import '../../ui/config/my_globals.dart';

class UserAppService {
  static Future<void> addUser({
    required Map<String, Object?> inputDetailsByUser,
    required BuildContext context,
    required List<String?> companyTags,
    required List<String?> askMeAboutTags,
    required List<String?> achievementsTags,
    required List<String?> techStackTags,
  }) async {
    inputDetailsByUser['email'] = AuthRepository().getEmailOfUser();
    inputDetailsByUser.forEach(
      (key, value) {
        if (value == null) {
          inputDetailsByUser[key] = "";
        }
        if (value is List &&
            value
                .any((element) => element.toString().compareTo("Other") == 0)) {
          (inputDetailsByUser[key] as List).remove("Other");
        }
      },
    );
    final _filterRepository = FilterRepository();
    await _filterRepository.addAchievementInList(achievementsTags);
    await _filterRepository.addAskMeAboutInList(askMeAboutTags);
    await _filterRepository.addCompanyInList(companyTags);
    await _filterRepository.addTeckStackInList(techStackTags);

    final UserRepository _userRepoObj = UserRepository();
    await _userRepoObj.addUser(inputDetailsByUser);
    String? userId = AuthAppService().getEmailOfUser();
    firestoreUserId = userId;
    fullName = await _userRepoObj.getFullName(userId!);
    headline = await _userRepoObj.getHeadline(userId);
    branch = await _userRepoObj.getBranch(userId);
    askMeAbout = await _userRepoObj.getAskMeAbout(userId);
    course = await _userRepoObj.getCourse(userId);
    experience = await _userRepoObj.getExperience(userId);
    techStack = await _userRepoObj.getTechStack(userId);
    company = await _userRepoObj.getCompany(userId);
    currentYear = await _userRepoObj.getCurrentYear(userId);
    github = await _userRepoObj.getGithub(userId);
    achievements = await _userRepoObj.getAchievements(userId);
    linkedin = await _userRepoObj.getLinkedin(userId);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
