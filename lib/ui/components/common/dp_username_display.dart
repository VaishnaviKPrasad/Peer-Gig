import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/custom_text_display.dart';
import '../../config/constants/colors.dart';

class DpUsernameDisplay extends StatelessWidget {
  final String? dpUrl;
  final String? username;
  const DpUsernameDisplay(
      {Key? key, @required this.dpUrl, @required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
              backgroundColor: AppColors.primaryLight,
              radius: 20,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    dpUrl!,
                  ),
                  radius: 19)),
          const SizedBox(width: 10),
          CustomTextDisplay(
            txt: username,
            isSelector: null,
          )
        ]);
  }
}
