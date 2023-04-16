import 'package:flutter/material.dart';
import 'package:quizapp3/shared/bottom_nav.dart';
import 'package:quizapp3/login/login.dart';
import 'package:quizapp3/topics/topics.dart';
import 'package:quizapp3/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading...');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error!!!'),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
