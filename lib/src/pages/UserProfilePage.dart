import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/services/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: Text('Google'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.signOutAlt,
                  size: 20,
                ),
                onPressed: () => context.read<GoogleSignInProvider>().logout())
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Perfil de usuario',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(user.photoURL),
              ),
              SizedBox(
                height: 8,
              ),
              Text('Nombre: ${user.displayName}'),
              SizedBox(
                height: 8,
              ),
              Text('Email: ${user.email}'),
            ],
          ),
        ));
  }
}
