import 'package:flutter/material.dart';
import 'package:peer_gig/data/authentication/auth_repository.dart';
import 'package:peer_gig/ui/components/common/account_profile.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/account_details.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';

class MyAccountAboutScreen extends StatefulWidget {
  const MyAccountAboutScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountAboutScreen> createState() => _MyAccountAboutScreenState();
}

class _MyAccountAboutScreenState extends State<MyAccountAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const AccountProfile(
                dpUrl:
                    "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                username: "Samridhi Sethi",
                followerCount: 50,
                followingCount: 80,
                isMyAccount: true,
                isFollowing: false),
            const SizedBox(height: 30.0),
            Expanded(
              child: ListView.builder(
                //shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: const [
                      AccountDetails(
                          txt: "Lorem ipsum dolor sit amet, consectetur",
                          editable: true,
                          title: "Achievements"),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  );
                },
              ),
            ),
            Center(
              child: CustomButton(
                txt: 'Log Out',
                onPressedFunc: () => AuthRepository().signOut(),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
