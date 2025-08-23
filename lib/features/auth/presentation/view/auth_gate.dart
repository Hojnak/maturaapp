import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matura_app_final/features/auth/presentation/view/login_or_register_screen.dart';
import 'package:matura_app_final/features/home/presentation/view/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(user: snapshot.data!);
          } else {

            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
