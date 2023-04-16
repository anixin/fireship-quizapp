import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:quizapp3/services/firestore.dart';
import 'package:quizapp3/services/models.dart';
import 'package:quizapp3/shared/bottom_nav.dart';
import 'package:quizapp3/shared/error.dart';
import 'package:quizapp3/shared/loading.dart';
import 'package:quizapp3/topics/drawer.dart';
import 'package:quizapp3/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(
              message: snapshot.error.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            bottomNavigationBar: const BottomNavBar(),
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
          );
        } else {
          return const Text('No Data found in firestore. Check DB');
        }
      },
      future: FirestoreService().getTopics(),
    );
  }
}
