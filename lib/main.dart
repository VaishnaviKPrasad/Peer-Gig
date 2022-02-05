import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Peer Gig',
            style: GoogleFonts.mallanna(
              color: const Color.fromARGB(0, 123, 47, 188),
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
