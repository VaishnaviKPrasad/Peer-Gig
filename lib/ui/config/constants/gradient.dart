//class SplashScreenGradient {}

import 'package:flutter/material.dart';
import 'colors.dart';

class SplashScreenGradient extends StatelessWidget {
  const SplashScreenGradient({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [AppColors.primary!, AppColors.highlightColor!],
          center: Alignment.center,
        )
      )
    );
  }
}

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
                  stops: const [0.60, 0.1])),
        ));
  }
}
