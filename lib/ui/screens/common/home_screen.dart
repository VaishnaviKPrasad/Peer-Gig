import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Home Screen'),
          ],
        ),
      ),
    );
  }
}
