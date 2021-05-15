import 'package:flutter/material.dart';
import 'package:quizler_app/question.dart';
import 'question.dart';
import 'questions.dart';
import '';

Questions ob=new Questions();

void main() => runApp(QuizlerApp());

class QuizlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Quizler: The Known Questions ',
            style: TextStyle(

              fontSize: 20.0,
              color: Colors.yellow
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: quiz(),
          ),
        ),
      ),
    );
  }
}

class quiz extends StatefulWidget {
  const quiz({Key key}) : super(key: key);

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {

  List<Icon> scorekeeper =[];

  void checkAns(bool userPick){
    setState(() {
    if (userPick==ob.getQuestionAns())
    {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else{
      scorekeeper.add(Icon(
        Icons.close,
        color:Colors.red,
      ));
    }
      ob.nextQues();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex:6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text( ob.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
        ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                  checkAns(true);
              },

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: (){
               checkAns(false);

              },
            ),
          ),
        ),

        Row(
          children: scorekeeper,
        )

      ],
    );
  }
}
