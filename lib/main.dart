import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/routes.dart';
import 'package:peer_gig/ui/screens/authentication/create_account.dart';
import 'package:peer_gig/ui/screens/authentication/sign_in_screen.dart';

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
    return const MaterialApp(
      initialRoute: CreateAccount.routeName,
      onGenerateRoute: GenerateRoutes.generateRoutes,
    );
  }
}
