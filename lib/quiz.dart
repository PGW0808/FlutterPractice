import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'questions_screen';
    });
  }


  void chooseScreen(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions_screen'){
      screenWidget = QuestionScreen(onSelectAnswer: chooseScreen,);
    }

    if(activeScreen == 'results_screen'){
      screenWidget == ResultScreen(userAnswer: selectedAnswers,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 17, 172, 241),
              Color.fromARGB(255, 253, 52, 134),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
