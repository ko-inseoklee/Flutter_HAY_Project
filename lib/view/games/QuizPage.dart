import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/Controller/GameController.dart';
import 'package:hay_project/model/games/Quiz.dart';

import 'ToggleButton.dart';

class QuizPage extends StatefulWidget {
  GameController gameController;
  QuizPage({Key? key, required this.gameController}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Quiz quiz;
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Quiz>(
        future: widget.gameController.loadRandomQuizGame(),
        builder: (context, snapshot){
          if(snapshot.hasData == false){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(!snapshot.hasError){
            quiz = snapshot.data!;
            return Column(
              children: [
                Expanded(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 40),
                            width: 303,
                            height: 191,
                            alignment: Alignment.center,
                            child: Text(quiz.question,textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)
                        ),
                        ToggleButton(isToggled: false, gameTitle: 'quiz',data: quiz,)

                      ],
                    )
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 130,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffffc93c)
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        quiz = await widget.gameController.loadRandomQuizGame();
                        setState(() {
                          isToggled = false;
                        });
                      },
                      child: Image.asset("image/GameIcons/CallRandom.png"),
                    ),
                  ),
                ),
              ],
            );
          }
          else{
            return Center(
              child: Text("데이터가 없습니다."),
            );
          }
        }
    );
  }
}
