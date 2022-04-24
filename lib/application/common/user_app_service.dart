import 'package:flutter/material.dart';
import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/data/authentication/auth_repository.dart';
import 'package:peer_gig/data/common/filter_repository.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/data/resource_sharing/follow_info_repository.dart';
import 'package:peer_gig/data/slot_booking/fifteen_mins_slot_info_repository.dart';
import 'package:peer_gig/data/slot_booking/mock_interview_slot_info_repository.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';
import 'package:peer_gig/utils/app_utils.dart';

class UserAppService {
  static Future<void> addUser({
    required Map<String, Object?> inputDetailsByUser,
    required BuildContext context,
    required List<String?> companyTags,
    required List<String?> askMeAboutTags,
    required List<String?> achievementsTags,
    required List<String?> techStackTags,
  }) async {
    final userId = AuthRepository().getEmailOfUser();
    inputDetailsByUser['email'] = userId;
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

    final _followInfo = FollowInfoRepository();
    _followInfo.addNewFollower(userId: userId, newFollowerUserId: "");
    _followInfo.addNewFollowing(userId: userId, newFollowingUserId: "");

    final _fifteenMinsSlotInfo = FifteenMinsSlotInfoRepository();
    Map<String, Object> _fifteenMinsSlotDetails = {
      'days': "Weekends",
      'startTime': 0000,
      'endTime': 0000
    };
    _fifteenMinsSlotInfo.addSlotDetails(
        userId: userId, appointmentDetails: _fifteenMinsSlotDetails);

    final _mockInterviewSlotInfo = MockInterviewSlotInfoRepository();
    Map<String, Object> _mockInterviewSlotDetails = {
      'days': "Weekends",
      'startTime': 0000,
      'endTime': 0000
    };
    _mockInterviewSlotInfo.addSlotDetails(
        userId: userId, appointmentDetails: _mockInterviewSlotDetails);

    final UserRepository _userRepoObj = UserRepository();
    await _userRepoObj.addUser(inputDetailsByUser);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  static Future<Map<String, String>> getUserDetails(String userId) async {
    final _userRepo = UserRepository();
    final _followInfoRepo = FollowInfoRepository();
    final _currentUserId = AuthAppService().getEmailOfUser();
    final List<String> _followings = await _followInfoRepo
        .getFollowing(_currentUserId!)
        .then((val) => val.cast<String>());
    final _isFollowing = _followings.contains(userId);

    Map<String, String> userDetails = {
      'fullName': await _userRepo.getFullName(userId),
      'dpUrl': await _userRepo.getDpUrl(userId),
      'followersCount':
          (await _followInfoRepo.getFollowersCount(userId)).toString(),
      'followingsCount':
          (await _followInfoRepo.getFollowingCount(userId)).toString(),
      'isFollowing': _isFollowing ? "True" : "False",
    };

    return userDetails;
  }

  static Future<Map<String, String>> getUserAttributesInfo(
      String userId) async {
    final _userRepo = UserRepository();
    Map<String, String> userDetails = {
      'Headline': await _userRepo.getHeadline(userId),
      'Course': await _userRepo.getCourse(userId),
      'Branch': await _userRepo.getBranch(userId),
      'Year': await _userRepo.getCurrentYear(userId),
      'Company': AppUtils.convertListToString(
          (await _userRepo.getCompany(userId)).cast<String>()),
      'Experiene': await _userRepo.getExperience(userId),
      'Tech Stack': AppUtils.convertListToString(
          (await _userRepo.getTechStack(userId)).cast<String>()),
      'Achievements': AppUtils.convertListToString(
          (await _userRepo.getAchievements(userId)).cast<String>()),
      'Ask Me About': AppUtils.convertListToString(
          (await _userRepo.getAskMeAbout(userId)).cast<String>()),
    };

    return userDetails;
  }
}
