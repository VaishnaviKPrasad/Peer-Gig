import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/screens/authentication/create_account.dart';
import './ui/config/constants/colors.dart';

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
        extendBody: true,
        appBar: AppBar(
          //actionsIconTheme: PeerGigIcons.,
          title: Text(
            'Peer Gig',
            style: GoogleFonts.mallanna(
              color: AppColors.primaryLight,
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.primary,
        ),
        body: const CreateAccount(),
      ),
    );
  }
}
