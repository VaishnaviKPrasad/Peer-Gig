import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:peer_gig/ui/config/routes.dart';
import 'package:peer_gig/ui/screens/authentication/sign_in_screen.dart';
import 'package:peer_gig/ui/screens/common/root_screen.dart';
import 'package:peer_gig/utils/app_utils.dart';
import 'package:peer_gig/utils/secrets.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'application/slot_booking/calendar_app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    var _clientID = ClientId(Secret.getId(), Secret.getClientSecret());
    const _scopes = [cal.CalendarApi.calendarScope];
    await clientViaUserConsent(_clientID, _scopes, AppUtils.prompt)
        .then((AuthClient client) async {
      CalendarAppService.calendar = cal.CalendarApi(client);
      print("######## Calendar Checking ${CalendarAppService.calendar}");
    });
  } catch (e) {
    print("######### Google Calendar API Error: ${e.toString()}");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
