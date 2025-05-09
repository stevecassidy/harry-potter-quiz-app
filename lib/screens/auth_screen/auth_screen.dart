import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/auth_screen/auth_widget.dart';

import '../../models/state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(context) {
    return Consumer<StateModel>(
      
      builder: (context, state, child) {
        return Container(
              color: const Color(0xffF2D3AC),
              child: Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/HP_Quiz_Logo.jpg',
                    width: 300,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "COMP3130 Quiz App",
                    style: TextStyle(
                      color: Color(0xff401201),
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const AuthWidget()
                ],
            ),
          ),
        );
      });
    }
}
