import 'question.dart';

class Questions{
  int _ques_no =0;
  List<Question> _quesBank =[
    Question(q: 'You can lead of cow down stairs but not up stairs', a: false),     //object creation
    Question(q:  'Approximately one quarter of human bones are in the feet ', a: true),
    Question(q:  'A slug\'s blood is green', a: true)
  ];

  void nextQues(){
    if(_ques_no < _quesBank.length-1)
      {
        _ques_no++;
      }
  }
    String getQuestionText(){
      return _quesBank[_ques_no].quesText;
    }

    bool getQuestionAns(){
      return _quesBank[_ques_no].quesAns;
    }
}