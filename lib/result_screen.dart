import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.userAnswer});

  final List<String> userAnswer;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i=0; i< userAnswer.length; i++){
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answer[0],
        'user-Answer' : userAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data){
      return data['user-Answer'] == data['correctAnswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestion out of $numTotalQuestion question correctly!"),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            const TextButton(onPressed: null, child: Text("Restart Quiz!"),),
          ],
        ),
      ),
    );
  }
}