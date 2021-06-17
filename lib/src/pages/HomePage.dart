import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/services/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
        centerTitle: true,
      ),
      body: Container(
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
                label: Text("SignIn with Google")),
            ElevatedButton.icon(
                onPressed: null,
                icon: FaIcon(
                  FontAwesomeIcons.facebookF,
                ),
                label: Text("Entrar con Facebook")),
          ],
        ),
      ),
    );
  }
}
