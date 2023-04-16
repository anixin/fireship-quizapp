import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp3/services/auth.dart';
import 'package:quizapp3/services/models.dart';
import 'package:quizapp3/shared/loading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.photoURL ??
                          'https://www.gravatar.com/avatar/placeholder'),
                    )),
              ),
              Text(
                user.email ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(),
              Text('${report.total}',
                  style: Theme.of(context).textTheme.headline2),
              Text('Quizzed Completed',
                  style: Theme.of(context).textTheme.subtitle2),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: const Text('Log Out'),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      return const Loader();
    }
  }
}
