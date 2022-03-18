import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({ Key? key }) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
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
            Text("My Account Screen"),
          ],
        ),
      ),
    );
  }
}