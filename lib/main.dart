import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/pages/HomePage.dart';
import 'package:flutter_firebase_auth/src/pages/HuaweiCheckPage.dart';
import 'package:flutter_firebase_auth/src/pages/UserProfilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      initialRoute: ' /home',
      routes: {
        '/home': (_) => HomePage(),
        '/huaweiCheck': (_) => HuaweiCheckPage(),
        '/userProfile': (_) => UserProfilePage(),
      },
    );
  }
}
