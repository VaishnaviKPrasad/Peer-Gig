import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/peer_gig_icons.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatefulWidget {
  int currentIndex;
  BottomNavbar({ Key? key, required this.currentIndex }) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List itemsTab = [
    {"icon": PeerGigIcons.home, "size": 30.0},
    {"icon": PeerGigIcons.search, "size": 30.0},
    {"icon": PeerGigIcons.calendar, "size": 25.0},
    {"icon": PeerGigIcons.myAccount, "size": 29.0},
  ];

  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
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