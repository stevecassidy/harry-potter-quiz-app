import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/auth_screen/auth_widget.dart';
import 'package:quiz_app/screens/home_screen/app_home_screen.dart';
import 'package:quiz_app/screens/questions_screen/app_questions_screen.dart';
import 'package:quiz_app/screens/results_screen/app_results_screen.dart';


import 'models/state.dart';

class Quiz extends StatelessWidget {
  final FirebaseAuth? auth;
  const Quiz({super.key, this.auth});
  
  @override
  Widget build(context) {
    // allow injection of FirebaseAuth instance (for testing)
    final firebaseAuth = auth ?? FirebaseAuth.instance;
  
    // Get the current user
    final User? currentUser = firebaseAuth.currentUser;
    print(currentUser);

    // Use user information
    final String displayName = currentUser?.email ?? 'User';
    
    return  Consumer<StateModel>( 
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Welcome, $displayName'),
              actions: [
                LogoutWidget(),
              ]
            ),
            body: Container(
              color: const Color(0xffF2D3AC),
              child: switch(state.quizStatus) {
                "in-progress" => const QuestionsScreen(),
                "complete" => const ResultsScreen(),
                _ => const HomeScreen(),
                }
              )
          );
        }
    
    );
  }
}