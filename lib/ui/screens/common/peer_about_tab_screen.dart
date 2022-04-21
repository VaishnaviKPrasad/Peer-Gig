import 'package:flutter/material.dart';
import 'package:peer_gig/ui/components/common/account_profile.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/account_details.dart';

class PeerAboutTabScreen extends StatefulWidget {
  const PeerAboutTabScreen({Key? key}) : super(key: key);

  @override
  State<PeerAboutTabScreen> createState() => _PeerAboutTabScreenState();
}

class _PeerAboutTabScreenState extends State<PeerAboutTabScreen> {
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
                  dpUrl: "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",  
                  username: "Sargam Agarwal", 
                  followerCount: 50, 
                  followingCount: 80, 
                  isMyAccount: false, 
                  isFollowing: false
                ),  
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
                            editable: false, 
                            title: "Achievements"
                          ),
                          SizedBox(height: 20.0,)
                        ],
                      );
                    },            
                  ),
                )                
              ],
            ),
        ),
    );
  }
}
