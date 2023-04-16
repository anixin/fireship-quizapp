import 'package:flutter/cupertino.dart';
import 'package:quizapp3/services/models.dart';

class QuizState with ChangeNotifier {
  double _progress = 0;
  Option? _selected;
  final PageController controller = PageController();

  double get progress => _progress;
  Option? get selected => _selected;

  set progress(double val) {
    _progress = val;
    notifyListeners();
  }

  set selected(Option? selected) {
    _selected = selected;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
