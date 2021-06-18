import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_firebase_auth/src/pages/HomePage.dart';
import 'package:flutter_firebase_auth/src/pages/HuaweiCheckPage.dart';
import 'package:flutter_firebase_auth/src/services/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Auth',
        initialRoute: '/home',
        routes: {
          '/home': (_) => HomePage(),
          '/huaweiCheck': (_) => HuaweiCheckPage(),
        },
      ),
    );
  }
}
