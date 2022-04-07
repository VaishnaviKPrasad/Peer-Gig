import 'package:flutter/material.dart';
import 'package:peer_gig/ui/screens/authentication/create_account_screen.dart';
import 'package:peer_gig/ui/screens/authentication/sign_in_screen.dart';
import 'package:peer_gig/ui/screens/common/error_screen.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';
import 'package:peer_gig/ui/screens/common/peer_account_screen.dart';
import 'package:peer_gig/ui/screens/common/root_screen.dart';

class GenerateRoutes {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );

      case CreateAccountScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => CreateAccountScreen(args.toString()),
        );

      case RootScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RootScreen(),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case PeerAccountScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => PeerAccountScreen(peerDetails: args as Map));

      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
