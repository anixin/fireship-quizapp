import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:quizapp3/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Quizz'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                  color: Colors.deepPurple,
                  icon: FontAwesomeIcons.userNinja,
                  text: 'Continue as guest',
                  loginMethod: AuthService().anonLogin),
            ),
            LoginButton(
              color: Colors.blue,
              icon: FontAwesomeIcons.google,
              text: 'Sign in with GOoGle',
              loginMethod: AuthService().googleLogin,
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.color,
      required this.icon,
      required this.text,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        onPressed: () => loginMethod(),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        label: Text(text),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
      ),
    );
  }
}
