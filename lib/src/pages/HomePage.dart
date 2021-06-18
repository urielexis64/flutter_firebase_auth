import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/pages/UserProfilePage.dart';
import 'package:flutter_firebase_auth/src/services/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasData)
            return UserProfilePage();
          else if (snapshot.hasError)
            return Center(child: Text('Algo salió mal...'));
          return SignUp();
        },
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'OS: ${Platform.operatingSystem}',
          ),
          ElevatedButton.icon(
              onPressed: () {
                final googleProvider = context.read<GoogleSignInProvider>();
                googleProvider.googleLogin();
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              label: Text("SignIn with Google")),
          ElevatedButton.icon(
              onPressed: null,
              icon: FaIcon(
                FontAwesomeIcons.facebookF,
              ),
              label: Text("Entrar con Facebook")),
          ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/huaweiCheck'),
              icon: FaIcon(
                FontAwesomeIcons.hSquare,
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
              label: Text("Huawei")),
        ],
      ),
    );
  }
}
