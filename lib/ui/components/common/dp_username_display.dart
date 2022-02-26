import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/text_display.dart';
import '../../config/constants/colors.dart';

class DpUsernameDisplay extends StatelessWidget {
  final String? dpUrl;
  final String? username;
  const DpUsernameDisplay(
      {Key? key, @required this.dpUrl, @required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      CircleAvatar(
          backgroundColor: AppColors.primaryLight,
          radius: 13,
          child: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
              ),
              radius: 12)),
      TextDisplay(txt: username)
    ]);
  }
}
