import 'package:flutter/material.dart';
import 'package:peer_gig/data/authentication/auth__repository.dart';
import 'package:peer_gig/data/common/filter_repository.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';

class UserAppService {
  static Future<void> addUser({
    required Map<String, Object?> inputDetailsByUser,
    required BuildContext context,
    required List<String?> companyTags,
    required List<String?> askMeAboutTags,
    required List<String?> achievementsTags,
    required List<String?> techStackTags,
  }) async {
    // print("################# User Details Map $inputDetailsByUser");
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
    await UserRepository().addUser(inputDetailsByUser);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
