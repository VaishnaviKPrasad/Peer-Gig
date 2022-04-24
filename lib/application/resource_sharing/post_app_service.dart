import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/data/resource_sharing/follow_info_repository.dart';
import 'package:peer_gig/data/resource_sharing/home_feed_posts_repository.dart';
import 'package:peer_gig/data/resource_sharing/my_posts_repository.dart';
import 'package:peer_gig/data/resource_sharing/single_post_info_repository.dart';
import 'package:peer_gig/utils/app_utils.dart';
import '../../domain/entities/resource_sharing/post.dart';

class PostAppService {
  // get post from post id
  Future<Post> getPostFromPostId(String postId) async {
    Map<String, dynamic> postDetails =
        await SinglePostInfoRepository().getPostDetails(postId);

    print("WHAT THE HELL IS THE ERROR!!!!! POST DETAILS");
    print(postDetails);

    String userId = postDetails['postedBy'].toString();
    DateTime date = (postDetails['date'] as Timestamp).toDate();

    String fullName = await UserRepository().getFullName(userId);
    String dpUrl = await UserRepository().getDpUrl(userId);

    print("WHAT THE HELL IS THE ERROR!!!!!");
    print(
      Post(
        body: postDetails['body'].toString(),
        dpUrl: dpUrl,
        postedByUsername: fullName,
        datePosted: AppUtils.dateToDisplayFormat(date),
      ),
    );
    return Post(
      body: postDetails['body'].toString(),
      dpUrl: dpUrl,
      postedByUsername: fullName,
      datePosted: AppUtils.dateToDisplayFormat(date),
    );
  }

  Future<void> addPost(String userId, Map<String, Object> postDetails) async {
    MyPostsRepository().addNewPost(userId: userId, map: postDetails);
    final _followInfoRepo = FollowInfoRepository();
    final List<String> _followers = await _followInfoRepo
        .getFollowers(userId)
        .then((val) => val.cast<String>());

    print("####### followers list $_followers");
    final _homeFeedPosts = HomeFeedPostsRepository();
    for (var singleFollower in _followers) {
      _homeFeedPosts.addNewHomeFeedPost(
          userId: singleFollower, map: postDetails);
    }
  }
}
