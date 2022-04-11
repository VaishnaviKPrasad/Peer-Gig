import 'package:flutter/material.dart';
import 'package:peer_gig/ui/screens/common/manage_my_slots_screen.dart';
import 'package:peer_gig/ui/screens/common/my_account_about_screen.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';
import 'package:peer_gig/ui/widgets/common/my_accounts_tab_bar.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({ Key? key }) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          txt: "MY ACCOUNT",
          tabBar: MyAccountTabBar(),
        ),
        body: TabBarView(
          children: [
            MyAccountAboutScreen(),
            ManageMySlotsScreen(),
          ],
        )
      ),      
    );
  }
}