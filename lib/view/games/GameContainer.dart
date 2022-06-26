import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/Controller/GameController.dart';
import 'package:hay_project/data/titles.dart';
import 'package:hay_project/view/games/BalanceGamePage.dart';
import 'package:hay_project/view/games/OXQuizPage.dart';
import 'package:hay_project/view/games/StartGamePage.dart';
import 'package:hay_project/view/games/WithOneMouthGamePage.dart';

import 'QuizPage.dart';

class GameContainer extends StatefulWidget {
  final String gameTitle;
  const GameContainer({Key? key, required this.gameTitle}) : super(key: key);

  @override
  _GameContainerState createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {
  int? gameIdx;
  GameController gameController = new GameController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameIdx = loadGameIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.gameTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff07689F),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff40A8C4),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                  colors: [Color(0xff07689F), Color(0xff71BACD)])),
          child: Center(child: loadGame(gameIdx!))),
    );
  }

  int loadGameIndex() {
    return gameTitles.indexOf(widget.gameTitle);
  }

  Widget loadGame(int idx) {
    switch (idx) {
      case 4:
        return StartGamePage(
          gameController: gameController,
        );
      case 3:
        return QuizPage(
          gameController: gameController,
        );
      case 2:
        return OXQuizPage(
          gameController: gameController,
        );
      case 1:
        return WithOneMouthGamePage(gameController: gameController);
      default:
        return BalanceGamePage(
          gameController: gameController,
        );
    }
  }
}
