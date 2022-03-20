import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';

class MyMeetingsScreen extends StatefulWidget {
  const MyMeetingsScreen({ Key? key }) : super(key: key);

  @override
  State<MyMeetingsScreen> createState() => _MyMeetingsScreenState();
}

class _MyMeetingsScreenState extends State<MyMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("My Meetings Screen"),
          ],
        ),
      ),
    );
  }
}