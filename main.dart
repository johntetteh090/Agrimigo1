import 'package:agrimigo/screens/signin.dart';
import 'package:agrimigo/services/authservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:agrimigo/constants.dart';
import 'package:agrimigo/screens/mobile_integrationPage.dart';
import 'package:agrimigo/screens/manualPumpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agrimigo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AuthService().handleAuth(),
     // home: MobileIntegrationPage(),
    );
  }
}
