import 'package:flutter/material.dart';
import 'colors.dart';

class SplashScreenGradient {}

class AppScreenGradient extends StatelessWidget {
  const AppScreenGradient({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColors.primary!, AppColors.secondary!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ));
  }
}
