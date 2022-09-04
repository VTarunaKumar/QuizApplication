import 'package:flutter/material.dart';

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
  List<String> question = [
    'the five rings on the Olympic flag are interlocking?',
    'Strictly Come Dancing first aired in the UK in 2005',
    ' a group of swans is known as a bevy?',
    'Sydney is the capital of Australia?',
    'the Penny Black is an old-fashioned coin?'
  ];

  List<bool> answers = [true, false, true, false, false];

  int questionNumber = 0;

  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
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
                question[questionNumber],
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
                  bool correectAnswer = answers[questionNumber];
                  if (correectAnswer == true) {
                    print("Right");
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    print("Wrong");
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  questionNumber++;
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
                bool correectAnswer = false;
                if (correectAnswer == false) {
                  print("Right");
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  print("Wrong");
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                }

                questionNumber++;
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
