import 'package:flutter/material.dart';
import '../customWidgets/GameCard.dart';
import 'package:hay_project/data/titles.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: <Widget>[
        GameCard(gameTitle: gameTitles[0],imagePath: "image/GameIcons/balanceGameIcon.png"),
        GameCard(gameTitle: gameTitles[1],imagePath: "image/GameIcons/oneWithMouthIcon.png"),
        GameCard(gameTitle: gameTitles[2],imagePath: "image/GameIcons/OXQuizIcon.png"),
        GameCard(gameTitle: gameTitles[3],imagePath: "image/GameIcons/quizIcon.png"),
        GameCard(gameTitle: gameTitles[4],imagePath: "image/GameIcons/startGameIcon.png"),
      ]),
    );
  }
}
