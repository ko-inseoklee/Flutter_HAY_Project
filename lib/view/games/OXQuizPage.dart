import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/Controller/GameController.dart';
import 'package:hay_project/model/games/OXQuiz.dart';

import 'ToggleButton.dart';

class OXQuizPage extends StatefulWidget {
  final GameController gameController;

  OXQuizPage({Key? key, required this.gameController}) : super(key: key);

  @override
  _OXQuizPageState createState() => _OXQuizPageState();
}

class _OXQuizPageState extends State<OXQuizPage> {
  late OXQuiz oxQuiz;
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OXQuiz>(
        future: widget.gameController.loadRandomOXQuizGame(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasError) {
            oxQuiz = snapshot.data!;
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
                        child: Text(
                          oxQuiz.question,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )),
                    ToggleButton(
                      isToggled: false,
                      gameTitle: 'ox',
                      data: oxQuiz,
                    )
                  ],
                )),
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
                        color: Color(0xffffc93c)),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        oxQuiz =
                            await widget.gameController.loadRandomOXQuizGame();
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
          } else {
            return Center(
              child: Text("데이터가 없습니다."),
            );
          }
        });
  }
}
