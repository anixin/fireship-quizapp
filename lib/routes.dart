import 'package:quizapp3/about/about.dart';
import 'package:quizapp3/home/home.dart';
import 'package:quizapp3/login/login.dart';
import 'package:quizapp3/topics/topics.dart';
import 'package:quizapp3/profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen(),
};
