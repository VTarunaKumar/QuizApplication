import 'package:flutter/material.dart';
import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/QuizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    ),
  );
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> question = [
  //   'the five rings on the Olympic flag are interlocking?',
  //   'Strictly Come Dancing first aired in the UK in 2005',
  //   ' a group of swans is known as a bevy?',
  //   'Sydney is the capital of Australia?',
  //   'the Penny Black is an old-fashioned coin?'
  // ];
  //
  // List<bool> answers = [true, false, true, false, false];
  // Questions q1 = Questions(q:'the five rings on the Olympic flag are interlocking?',a:true );
  int questionNumber = 0;

  List<Icon> scoreKeeper = [
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  bool correectAnswer =
                      quizBrain.questionBank[questionNumber].questionAnswer;
                  if (correectAnswer == true) {
                    if (scoreKeeper.length > 5) {
                      print("Right");
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    }
                  } else {
                    if (scoreKeeper.length < 5) {
                      print("Wrong");
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                  }
                  if (questionNumber < 5) {
                    questionNumber++;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: FlatButton(
            color: Colors.red,
            child: Text(
              "False",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                bool correectAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;
                if (correectAnswer == false) {
                  if (scoreKeeper.length > 5) {
                    print("Right");
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }
                } else {
                  if (scoreKeeper.length > 5) {
                    print("Wrong");
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                }
                if (questionNumber < 5) {
                  questionNumber++;
                }
              });
            },
          ),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
