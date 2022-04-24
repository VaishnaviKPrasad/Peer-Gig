import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/data/resource_sharing/follow_info_repository.dart';

class FollowAppService {
  static Future<void> followAPeer(String peerId) async {
    String? _currUserId = AuthAppService().getEmailOfUser();

    print("##### Follow Info: peer id $peerId");
    print("##### Follow Info: cuurent user id $_currUserId");

    final _followInfoRepo = FollowInfoRepository();
    await _followInfoRepo.addNewFollowing(
        userId: _currUserId, newFollowingUserId: peerId);
    await _followInfoRepo.addNewFollower(
        userId: peerId, newFollowerUserId: _currUserId);

    print("##### Follow Info: Following successful!");
  }
}
