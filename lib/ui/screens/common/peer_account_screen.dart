import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';
import 'package:peer_gig/ui/widgets/common/custom_tab_bar.dart';

class PeerAccountScreen extends StatefulWidget {
  static const routeName = '/peerAccountScreen';
  final Map peerDetails;
  const PeerAccountScreen({required this.peerDetails, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PeerAccountScreenState();
}

class _PeerAccountScreenState extends State<PeerAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          txt: widget.peerDetails['fullName'],
          tabBar: const CustomTabBar(
            customTabs: [
              Text("About"),
              Text("15mins Slot"),
              Text("Mock Interview Slot"),
            ],
            length: 3,
          ),
        ),
      ),
    );
  }
}
