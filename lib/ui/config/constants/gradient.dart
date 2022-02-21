import 'package:flutter/material.dart';
import 'colors.dart';

class AppScreenGradient extends LinearGradient {
  AppScreenGradient()
      : super(
          colors: [AppColors.primary!, AppColors.secondary!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.60, 1.0],
        );
}
