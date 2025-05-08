import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:quiz_app/app_quiz.dart';
import 'package:quiz_app/models/state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/screens/auth_screen/auth_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    ChangeNotifierProvider(
        create: (context) => StateModel(http.Client()),
        child: MaterialApp(
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User? user = snapshot.data;
                if (user != null) {
                  return const Quiz();
                } else {
                  return const AuthScreen();
                }
              }
              return const CircularProgressIndicator();
            }),
        )
    )
  );
}
