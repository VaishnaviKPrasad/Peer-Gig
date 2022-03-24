import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/routes.dart';
import 'package:peer_gig/ui/screens/authentication/create_account_screen.dart';
import 'package:peer_gig/ui/screens/authentication/sign_in_screen.dart';
import 'package:peer_gig/ui/screens/common/home_screen.dart';
import 'package:peer_gig/ui/screens/common/root_screen.dart';
import 'package:peer_gig/ui/screens/resource_sharing/home_feed_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return SnackBar(
                  content: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                return const RootScreen();
              } else {
                return const SignInScreen();
              }
            }),
      ),
      onGenerateRoute: GenerateRoutes.generateRoutes,
    );
  }
}
