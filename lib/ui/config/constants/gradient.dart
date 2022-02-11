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

class AppScreenGradient {}
