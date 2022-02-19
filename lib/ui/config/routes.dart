import 'package:flutter/material.dart';
import 'package:peer_gig/ui/screens/authentication/create_account.dart';
import 'package:peer_gig/ui/screens/authentication/sign_in_screen.dart';
import 'package:peer_gig/ui/screens/common/error_screen.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';

class GenerateRoutes {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );

      case CreateAccount.routeName:
        return MaterialPageRoute(
          builder: (context) => CreateAccount(args.toString()),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
