import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/peer_gig_icons.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';
import 'package:peer_gig/ui/screens/common/my_account.dart';
import 'package:peer_gig/ui/screens/common/my_meetings.dart';
import 'package:peer_gig/ui/screens/common/search_a_peer_screen.dart';
import 'package:peer_gig/ui/widgets/common/bottom_nav_bar.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/rootScreen';
  const RootScreen({ Key? key }) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List txt = [
    "HOME SCREEN",
    "SEARCH A PEER",
    "MY MEETINGS",
    "MY ACCOUNT",
  ];
  
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(txt: txt[activeTab]),
      body: IndexedStack(
        index: activeTab, children: const [
          HomeScreen(),
          SearchAPeerScreen(),
          MyMeetingsScreen(),
          MyAccountScreen(),
        ]
      ),
      bottomNavigationBar: getBottomNavbar(),
    );
  }

  Widget getBottomNavbar() {
    List itemsTab = [
      {"icon": PeerGigIcons.home, "size": 30.0},
      {"icon": PeerGigIcons.search, "size": 30.0},
      {"icon": PeerGigIcons.calendar, "size": 25.0},
      {"icon": PeerGigIcons.myAccount, "size": 29.0},
    ];
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDark,        
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(itemsTab.length, (currentIndex) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = currentIndex;
                  });
                },
                icon: Icon(
                  itemsTab[currentIndex]['icon'],
                  size: itemsTab[currentIndex]['size'],
                  color: activeTab == currentIndex ? AppColors.secondary : AppColors.highlightColor,
                )
            );
          }),
        )
      )
    );
  }
}


