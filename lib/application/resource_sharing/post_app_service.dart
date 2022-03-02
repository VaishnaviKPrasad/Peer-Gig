import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/data/resource_sharing/single_post_info_repository.dart';
import 'package:peer_gig/utils/app_utils.dart';
import '../../domain/entities/resource_sharing/post.dart';

class PostAppService {
  // get post from post id
  Future<Post> getPostFromPostId(String postId) async {
    Map<String, dynamic> postDetails =
        await SinglePostInfoRepository().getPostDetails(postId);

    print("WHAT THE F*** IS THE ERROR!!!!! POST DETAILS");
    print(postDetails);

    String userId = postDetails['postedBy'].toString();
    DateTime date = (postDetails['date'] as Timestamp).toDate();

    String fullName = await UserRepository().getFullName(userId);
    String dpUrl = await UserRepository().getDpUrl(userId);

    print("WHAT THE F*** IS THE ERROR!!!!!");
    print(Post(
      body: postDetails['body'].toString(),
      dpUrl: dpUrl,
      postedByUsername: fullName,
      datePosted: AppUtils.dateToDisplayFormat(date),
    ));
    return Post(
      body: postDetails['body'].toString(),
      dpUrl: dpUrl,
      postedByUsername: fullName,
      datePosted: AppUtils.dateToDisplayFormat(date),
    );
  }
}
