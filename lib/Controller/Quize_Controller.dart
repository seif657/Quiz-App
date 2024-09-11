import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project15/Model/Question_Model.dart';
import 'package:project15/screens/result_screen.dart';

class Quize_Controller extends GetxController {
  RxString name = ''.obs;
  List<Question_Model> _questions = [
    Question_Model(
        id: 1,
        question: "What is the capital of Syria?",
        options: ["Damascus", "Beruit", "Arpil"],
        answer: 1),
    Question_Model(
        id: 2,
        question: "What is the most famouse language in the world?",
        options: ["Spanish", "English", "Frensh"],
        answer: 2),
    Question_Model(
        id: 3,
        question: "Who is the best player in the world?",
        options: ["Pele", "Messi", "Ronlado"],
        answer: 3),
    Question_Model(
        id: 4,
        question: "What is the nationality "
            "of Albert Einstein?",
        options: ["German", "American", "Spanish"],
        answer: 1),
  ];

  bool _isPressed = false;
  double _numberOfQuestoin = 0;
  int? _selectedAnswer;
  RxInt _countOfCorrectedAnswer = 0.obs;
  final RxInt _sec = 15.obs;

  int get countOfQuestion => _questions.length;
  List<Question_Model> get questions => [..._questions]; //???
  bool get isPressed => _isPressed;
  double get numberOfQuestoin => _numberOfQuestoin;
  int? get selectedAnswer => _selectedAnswer;
  RxInt get countOfCorrectedAnswer => _countOfCorrectedAnswer;
  RxInt get sec => _sec;
  int? _correctAnswer;
  final Map<int, bool> __questionIsAnswerd = {};
  Timer? _timer;
  final maxSec = 15;
  late PageController pageController; //???d

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    _numberOfQuestoin = 0; // Initialize question number to 1
    restAnswer();

    super.onInit();
  }

  void updateQuestionNumber(int index) {
    _numberOfQuestoin = index.toDouble();
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  RxInt get socreResult {
    print(
        "1111111111111111111the value of the score result are111111111111111111" +
            countOfCorrectedAnswer.value.toString());
    return countOfCorrectedAnswer;
  }

  void checkAnswer(Question_Model question_model, int selectedAnswer) {
    _isPressed = true;
    _selectedAnswer = selectedAnswer + 1;
    _correctAnswer = question_model.answer;

    // Debug prints to check values
    print("Selected Answer: $_selectedAnswer");
    print("Correct Answer: $_correctAnswer");

    if (_correctAnswer == _selectedAnswer) {
      _countOfCorrectedAnswer.value++;
      print(
          "Correct answer count incremented: ${_countOfCorrectedAnswer.value}");
    } else {
      print("Answer was incorrect.");
    }

    stopTimer();

    // Mark the question as answered
    __questionIsAnswerd.update(question_model.id, (value) => true);

    // Notify UI about changes
    update();

    // Wait for a short delay before moving to the next question
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
  }

  set countOfCorrectedAnswer(RxInt value) {
    _countOfCorrectedAnswer = value;
    print(
        "---------------the value of the private correct answer are : ----------" +
            _countOfCorrectedAnswer.value.toString());
  }

  bool checkIfQuestionIsAnswred(int questionId) {
    return __questionIsAnswerd.entries
        .firstWhere((element) => element.key == questionId,
            orElse: () => MapEntry(
                questionId, false) // Provide a default value if not found
            )
        .value;
  }

  void restAnswer() {
    for (var element in _questions) {
      __questionIsAnswerd[element.id] = false; // Initialize with default value
    }
    update();
  }

  Color getColor(int answerIndex) {
    print("Checking color for answerIndex: $answerIndex");
    if (_isPressed) {
      if (answerIndex + 1 == _correctAnswer) {
        print("Correct answer: ${_correctAnswer}");
        return Colors.green; // Correct answer
      } else if (answerIndex + 1 == _selectedAnswer &&
          _correctAnswer != _selectedAnswer) {
        print("Selected wrong answer: $_selectedAnswer");
        return Colors.red; // Incorrect answer
      }
    }
    return Colors.white; // Default color
  }

  IconData getIcon(int answerIndex) {
    if (isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectedAnswer &&
          _correctAnswer != _selectedAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void nextQuestion() {
    if (_timer != null && _timer!.isActive) {
      stopTimer();
    }

    if (pageController.hasClients) {
      if (pageController.page == _questions.length - 1) {
        // Final question logic
      } else {
        _isPressed = false;
        pageController.animateToPage(
          pageController.page!.toInt() + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
        startTimer();
      }

      _numberOfQuestoin = pageController.page! + 1; // Update question number
      update(); // Notify UI about changes

      if (_numberOfQuestoin == countOfQuestion) {
        _numberOfQuestoin = countOfQuestion.toDouble();
        Get.toNamed(ResultScreen.routeName);
      }
    }
  }

  void startTimer() {
    restTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  void restTimer() => _sec.value = maxSec;
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectedAnswer.value = 0; // Reset the score to 0
    _selectedAnswer = null;
    _numberOfQuestoin = 1;
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
    restAnswer();
    update(); // Ensure UI is updated
  }
}
